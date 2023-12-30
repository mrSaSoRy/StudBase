
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Departments
-- ----------------------------
DROP TABLE IF EXISTS `Departments`;
CREATE TABLE `Departments`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Evening` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 AVG_ROW_LENGTH = 8192 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for RequestStatus
-- ----------------------------
DROP TABLE IF EXISTS `RequestStatus`;
CREATE TABLE `RequestStatus`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Score` double NOT NULL,
  `CopyAttestat` tinyint(1) NOT NULL,
  `Enrolled` tinyint(1) NOT NULL,
  `Paid` tinyint(1) NOT NULL,
  `Hostel` tinyint(1) NOT NULL,
  `CompleteDocument` tinyint(1) NOT NULL,
  `RequestID` int(11) NOT NULL,
  `IsEdit` tinyint(1) NOT NULL DEFAULT 0,
  `IsFromSite` tinyint(1) NOT NULL DEFAULT 0,
  `BroughtFluorography` tinyint(1) NOT NULL DEFAULT 0,
  `BroughtVaccinations` tinyint(1) NOT NULL DEFAULT 0,
  `BroughtMedicineLetter` tinyint(1) NOT NULL DEFAULT 0,
  `TookDocuments` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `RequestID`(`RequestID`) USING BTREE,
  CONSTRAINT `FK_requeststatus` FOREIGN KEY (`RequestID`) REFERENCES `Requests` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Requests
-- ----------------------------
DROP TABLE IF EXISTS `Requests`;
CREATE TABLE `Requests`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `DateCreate` datetime(6) NOT NULL,
  `Sended` tinyint(1) NOT NULL,
  `DateSended` datetime(6) NOT NULL,
  `Status` int(11) NOT NULL,
  `ErrorMessage` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Dogovor` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `UserID`(`UserID`) USING BTREE,
  CONSTRAINT `Requests_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1724 AVG_ROW_LENGTH = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for RequestsAddInfo
-- ----------------------------
DROP TABLE IF EXISTS `RequestsAddInfo`;
CREATE TABLE `RequestsAddInfo`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Privilege` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `PrivilegeDoc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `English` tinyint(1) NOT NULL,
  `German` tinyint(1) NOT NULL,
  `Chine` tinyint(1) NOT NULL,
  `Olympiad` tinyint(1) NOT NULL,
  `NeedRoom` tinyint(1) NOT NULL,
  `Invalid` tinyint(1) NOT NULL,
  `Orphan1` tinyint(1) NOT NULL,
  `Orphan2` tinyint(1) NOT NULL,
  `SportRank` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `RequestID` int(11) NOT NULL,
  `Commissariat` smallint(2) NOT NULL DEFAULT -1,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `RequestID`(`RequestID`) USING BTREE,
  CONSTRAINT `FK_requestsaddinfo_requests_ID` FOREIGN KEY (`RequestID`) REFERENCES `Requests` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1722 AVG_ROW_LENGTH = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for RequestsEducationInfo
-- ----------------------------
DROP TABLE IF EXISTS `RequestsEducationInfo`;
CREATE TABLE `RequestsEducationInfo`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AttestatYear` int(11) NOT NULL,
  `DocumentType` int(11) NOT NULL,
  `Series` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EducationPlace` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RequestID` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `RequestID`(`RequestID`) USING BTREE,
  CONSTRAINT `FK_requestseducationinfo_requests_ID` FOREIGN KEY (`RequestID`) REFERENCES `Requests` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1721 AVG_ROW_LENGTH = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for RequestsMainInfo
-- ----------------------------
DROP TABLE IF EXISTS `RequestsMainInfo`;
CREATE TABLE `RequestsMainInfo`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SecondName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gender` int(11) NOT NULL,
  `Birtday` datetime(6) NOT NULL,
  `BirthdayPlace` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RequestID` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `RequestID`(`RequestID`) USING BTREE,
  CONSTRAINT `FK_requestsmaininfo_requests_ID` FOREIGN KEY (`RequestID`) REFERENCES `Requests` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1714 AVG_ROW_LENGTH = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for RequestsParentInfo
-- ----------------------------
DROP TABLE IF EXISTS `RequestsParentInfo`;
CREATE TABLE `RequestsParentInfo`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FullFamily` tinyint(1) NOT NULL,
  `ManyChilds` tinyint(1) NOT NULL,
  `ParentPensioner` tinyint(1) NOT NULL,
  `ParentInvalid` tinyint(1) NOT NULL,
  `LowIncome` tinyint(1) NOT NULL,
  `ParentFIO` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `PhoneParent` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SnilsParent` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addressParent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `NationParent` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `BirthDayParent` datetime(6) NULL DEFAULT NULL,
  `ParentFIO2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `PhoneParent2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SnilsParent2` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addressParent2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `NationParent2` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `BirthDayParent2` datetime(6) NULL DEFAULT NULL,
  `RequestID` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `RequestID`(`RequestID`) USING BTREE,
  CONSTRAINT `FK_requestsparentinfo_requests_ID` FOREIGN KEY (`RequestID`) REFERENCES `Requests` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1714 AVG_ROW_LENGTH = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for RequestsPassportInfo
-- ----------------------------
DROP TABLE IF EXISTS `RequestsPassportInfo`;
CREATE TABLE `RequestsPassportInfo`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nation` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Snils` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Series` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DateGet` datetime(6) NOT NULL,
  `Organization` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Address` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AddressLive` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RequestID` int(11) NOT NULL,
  `DocType` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Polis` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `RequestID`(`RequestID`) USING BTREE,
  CONSTRAINT `FK_requestspassportinfo_requests_ID` FOREIGN KEY (`RequestID`) REFERENCES `Requests` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1713 AVG_ROW_LENGTH = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for RequestsSpecialInfo
-- ----------------------------
DROP TABLE IF EXISTS `RequestsSpecialInfo`;
CREATE TABLE `RequestsSpecialInfo`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RequestID` int(11) NOT NULL,
  `FirstSPO` tinyint(1) NOT NULL,
  `SchoolBase` int(11) NOT NULL,
  `SpecialID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `Budget` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `RequestID`(`RequestID`) USING BTREE,
  INDEX `FK_requestsspecialinfo`(`DepartmentID`) USING BTREE,
  INDEX `FK_requestsspecialinfo2`(`SpecialID`) USING BTREE,
  CONSTRAINT `FK_requestsspecialinfo` FOREIGN KEY (`DepartmentID`) REFERENCES `Departments` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_requestsspecialinfo2` FOREIGN KEY (`SpecialID`) REFERENCES `Specials` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_requestsspecialinfo_requests_ID` FOREIGN KEY (`RequestID`) REFERENCES `Requests` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1711 AVG_ROW_LENGTH = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Specials
-- ----------------------------
DROP TABLE IF EXISTS `Specials`;
CREATE TABLE `Specials`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentID` int(11) NOT NULL,
  `Title` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SchoolBase` int(11) NOT NULL,
  `HasBudget` tinyint(1) NOT NULL,
  `CountPlan` int(11) NOT NULL,
  `GroupNumber` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Examinate` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `OrphanPlan` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_specials`(`DepartmentID`) USING BTREE,
  CONSTRAINT `FK_specials` FOREIGN KEY (`DepartmentID`) REFERENCES `Departments` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 123 AVG_ROW_LENGTH = 442 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1708 AVG_ROW_LENGTH = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
