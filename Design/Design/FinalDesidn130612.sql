/*
SQLyog Community v10.0 
MySQL - 5.5.24 : Database - fuelfetch
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fuelfetch` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fuelfetch`;

/*Table structure for table `amountfromcashier` */

DROP TABLE IF EXISTS `amountfromcashier`;

CREATE TABLE `amountfromcashier` (
  `Cashier_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Cashier_ID`,`Date`,`Time`),
  CONSTRAINT `FK_EID_AFC` FOREIGN KEY (`Cashier_ID`) REFERENCES `employee` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `amountfromcashier` */

insert  into `amountfromcashier`(`Cashier_ID`,`Date`,`Time`,`Amount`,`RecordStamp`) values (2,'2012-06-05','12:14:00','312566.00',NULL),(2,'2012-06-05','12:15:00','256.00',NULL),(3,'2012-06-05','00:00:00','300000.00',NULL),(5,'2012-06-05','00:00:00','265963.00',NULL);

/*Table structure for table `cashierfuelcreditsale` */

DROP TABLE IF EXISTS `cashierfuelcreditsale`;

CREATE TABLE `cashierfuelcreditsale` (
  `Credit_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Cashier_ID` int(5) NOT NULL,
  `FuelType` int(5) NOT NULL,
  `CreditSale_Ltrs` int(5) DEFAULT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Date`,`Cashier_ID`,`FuelType`),
  KEY `Credit_ID` (`Credit_ID`),
  KEY `FK_Emp_CFCS` (`Cashier_ID`),
  KEY `FK)Item_CFCS` (`FuelType`),
  CONSTRAINT `FK)Item_CFCS` FOREIGN KEY (`FuelType`) REFERENCES `detaileditem` (`DID`),
  CONSTRAINT `FK_Emp_CFCS` FOREIGN KEY (`Cashier_ID`) REFERENCES `employee` (`EID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `cashierfuelcreditsale` */

insert  into `cashierfuelcreditsale`(`Credit_ID`,`Date`,`Cashier_ID`,`FuelType`,`CreditSale_Ltrs`,`RecordStamp`) values (1,'2012-06-05',2,1,26,NULL),(2,'2012-06-05',2,3,35,NULL),(3,'2012-06-05',3,2,68,NULL),(4,'2012-06-05',3,4,90,NULL),(5,'2012-06-05',5,1,60,NULL),(6,'2012-06-12',5,1,40,'2012-06-12 11:50:08');

/*Table structure for table `dailydip` */

DROP TABLE IF EXISTS `dailydip`;

CREATE TABLE `dailydip` (
  `Date` date NOT NULL,
  `TID` int(5) NOT NULL,
  `DIP_READINGM` decimal(10,2) DEFAULT NULL,
  `DIP_READINGE` decimal(10,2) DEFAULT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Date`,`TID`),
  KEY `FK_TANK` (`TID`),
  KEY `FK_DIPM` (`DIP_READINGM`),
  KEY `FK_DIPE` (`DIP_READINGE`),
  CONSTRAINT `FK_DIPE` FOREIGN KEY (`DIP_READINGE`) REFERENCES `dip` (`DIP_ID`),
  CONSTRAINT `FK_DIPM` FOREIGN KEY (`DIP_READINGM`) REFERENCES `dip` (`DIP_ID`),
  CONSTRAINT `FK_TANK` FOREIGN KEY (`TID`) REFERENCES `tank` (`TID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dailydip` */

insert  into `dailydip`(`Date`,`TID`,`DIP_READINGM`,`DIP_READINGE`,`RecordStamp`) values ('2012-06-06',1,'3.00','3.25',NULL),('2012-06-06',2,'3.00','3.00',NULL),('2012-06-07',1,'3.25','3.25',NULL);

/*Table structure for table `detaileditem` */

DROP TABLE IF EXISTS `detaileditem`;

CREATE TABLE `detaileditem` (
  `DID` int(5) NOT NULL AUTO_INCREMENT,
  `PID` int(5) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `MRP` double(10,2) NOT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DID`),
  KEY `FK_Packing_Item` (`PID`),
  CONSTRAINT `FK_Packing_Item` FOREIGN KEY (`PID`) REFERENCES `packing` (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `detaileditem` */

insert  into `detaileditem`(`DID`,`PID`,`Description`,`MRP`,`RecordStamp`) values (1,12,'Petrol',82.00,NULL),(2,12,'Diesel',45.00,NULL),(3,12,'Petrol Octane',85.00,NULL),(4,12,'Diesel Super',47.00,NULL),(5,1,'ServoMG 1Ltr\r\n',175.00,NULL),(6,3,'ServoMG 5Ltr\r\n',750.00,NULL),(7,4,'ServoMG 7.5ltr\r\n',1100.00,NULL),(8,1,'Servo15/40 1Ltr\r\n',210.00,NULL),(9,5,'Servo15/40 5Ltr\r\n',865.00,NULL),(10,8,'MG Grease 1Kg\r\n',200.00,NULL),(11,10,'MG Frease 5Kg\r\n',1100.00,NULL),(12,1,'Distilled Water',15.00,NULL),(13,1,'Acid 1300G',35.00,NULL);

/*Table structure for table `dip` */

DROP TABLE IF EXISTS `dip`;

CREATE TABLE `dip` (
  `DIP_ID` decimal(10,2) NOT NULL,
  `TC_ID` int(5) NOT NULL,
  `DIP_Value` decimal(10,2) NOT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DIP_ID`,`TC_ID`),
  KEY `FK_TC_DIP` (`TC_ID`),
  CONSTRAINT `FK_TC_DIP` FOREIGN KEY (`TC_ID`) REFERENCES `tankcapacity` (`TC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dip` */

insert  into `dip`(`DIP_ID`,`TC_ID`,`DIP_Value`,`RecordStamp`) values ('3.00',1,'2500.00',NULL),('3.00',2,'2600.00',NULL),('3.00',3,'2659.00',NULL),('3.25',1,'2650.00',NULL),('3.25',3,'6500.00',NULL),('3.60',1,'2659.00',NULL),('3.69',1,'6586.00',NULL);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `EID` int(5) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `Designation` enum('Manager','Cashier','Del. Boy','Watchman') NOT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`EID`,`Name`,`Designation`,`RecordStamp`) values (1,'Rafiq','Manager',NULL),(2,'Sadiq','Cashier',NULL),(3,'Veeresh','Cashier',NULL),(4,'Basava','Del. Boy',NULL),(5,'Seenu','Del. Boy',NULL),(6,'Jerry','Cashier',NULL),(7,'John','Del. Boy',NULL),(8,'Mike','Del. Boy',NULL);

/*Table structure for table `employeeattendance` */

DROP TABLE IF EXISTS `employeeattendance`;

CREATE TABLE `employeeattendance` (
  `Att_ID` int(5) NOT NULL AUTO_INCREMENT,
  `EID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Attendance` enum('Present','Absent','Half Day') NOT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Att_ID`),
  KEY `FK_Employee_Attend` (`EID`),
  CONSTRAINT `FK_Employee_Attend` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employeeattendance` */

/*Table structure for table `indentdetails` */

DROP TABLE IF EXISTS `indentdetails`;

CREATE TABLE `indentdetails` (
  `Indent_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Order_ID` varchar(20) NOT NULL,
  `MS` int(2) DEFAULT '0',
  `HSD` int(2) DEFAULT '0',
  `MSOctane` int(2) DEFAULT '0',
  `HSDSuper` int(2) DEFAULT '0',
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Indent_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `indentdetails` */

/*Table structure for table `invent` */

DROP TABLE IF EXISTS `invent`;

CREATE TABLE `invent` (
  `DID` int(5) NOT NULL,
  `Qty` int(5) NOT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DID`),
  KEY `FK_Item_Invent` (`DID`),
  CONSTRAINT `FK_Item_Invent` FOREIGN KEY (`DID`) REFERENCES `detaileditem` (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `invent` */

insert  into `invent`(`DID`,`Qty`,`RecordStamp`) values (5,4,NULL),(6,4,NULL),(7,6,NULL),(8,8,NULL),(9,2,NULL),(10,4,NULL),(11,2,NULL),(12,20,NULL),(13,16,NULL);

/*Table structure for table `lubesale` */

DROP TABLE IF EXISTS `lubesale`;

CREATE TABLE `lubesale` (
  `LS_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `CashierID` int(5) NOT NULL,
  `SaleType` enum('Cash Sale','Credit Sale') NOT NULL,
  `DID` int(5) NOT NULL,
  `Qty` decimal(10,2) NOT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LS_ID`),
  KEY `FK_Employee_LubeSale` (`CashierID`),
  KEY `FK_Item_LubeSale` (`DID`),
  CONSTRAINT `FK_Employee_LubeSale` FOREIGN KEY (`CashierID`) REFERENCES `employee` (`EID`),
  CONSTRAINT `FK_Item_LubeSale` FOREIGN KEY (`DID`) REFERENCES `detaileditem` (`DID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `lubesale` */

insert  into `lubesale`(`LS_ID`,`Date`,`CashierID`,`SaleType`,`DID`,`Qty`,`RecordStamp`) values (1,'2012-06-05',2,'Cash Sale',5,'1.00',NULL),(2,'2012-06-05',2,'Cash Sale',6,'1.00',NULL),(3,'2012-06-05',3,'Credit Sale',7,'1.00',NULL),(4,'2012-06-05',3,'Cash Sale',8,'1.00',NULL),(5,'2012-06-05',2,'Cash Sale',9,'1.00',NULL),(6,'2012-06-05',3,'Cash Sale',10,'1.00',NULL),(7,'2012-06-05',5,'Cash Sale',11,'1.00',NULL),(8,'2012-06-05',5,'Credit Sale',12,'1.00',NULL),(9,'2012-06-05',2,'Cash Sale',6,'1.00',NULL),(10,'2012-06-05',3,'Cash Sale',7,'1.00',NULL),(11,'2012-06-05',5,'Cash Sale',8,'1.00',NULL),(23,'2012-06-07',2,'Cash Sale',5,'1.00',NULL),(24,'2012-06-08',2,'Cash Sale',5,'1.00',NULL),(25,'2012-06-14',2,'Cash Sale',5,'1.00',NULL),(26,'2012-06-07',2,'Cash Sale',5,'1.00',NULL);

/*Table structure for table `nozzel` */

DROP TABLE IF EXISTS `nozzel`;

CREATE TABLE `nozzel` (
  `NID` int(5) NOT NULL AUTO_INCREMENT,
  `TID` int(5) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`NID`),
  KEY `FK_Tank_Nozzel` (`TID`),
  CONSTRAINT `FK_Tank_Nozzel` FOREIGN KEY (`TID`) REFERENCES `tank` (`TID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=dec8;

/*Data for the table `nozzel` */

insert  into `nozzel`(`NID`,`TID`,`Name`,`RecordStamp`) values (1,1,'MS1',NULL),(2,1,'MS2',NULL),(3,1,'MS3',NULL),(4,2,'HSD1',NULL),(5,2,'HSD2',NULL),(6,3,'MSO1',NULL),(7,3,'MSO2',NULL),(8,4,'HSDSuper1',NULL);

/*Table structure for table `nozzelsale` */

DROP TABLE IF EXISTS `nozzelsale`;

CREATE TABLE `nozzelsale` (
  `NozSaleID` int(5) NOT NULL AUTO_INCREMENT,
  `NID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `CashierID` int(5) NOT NULL,
  `Opening` decimal(15,0) NOT NULL,
  `Closing` decimal(15,0) NOT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`NozSaleID`),
  KEY `FK_Nozzel_NozSale` (`NID`),
  KEY `FK_Employee_NozSale` (`CashierID`),
  CONSTRAINT `FK_Employee_NozSale` FOREIGN KEY (`CashierID`) REFERENCES `employee` (`EID`),
  CONSTRAINT `FK_Nozzel_NozSale` FOREIGN KEY (`NID`) REFERENCES `nozzel` (`NID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `nozzelsale` */

insert  into `nozzelsale`(`NozSaleID`,`NID`,`Date`,`CashierID`,`Opening`,`Closing`,`RecordStamp`) values (4,1,'2012-06-05',2,'1200','2400',NULL),(5,2,'2012-06-05',2,'1300','3400',NULL),(6,3,'2012-06-05',5,'1453','3000',NULL),(7,4,'2012-06-05',3,'6598','7000',NULL),(8,5,'2012-06-05',3,'2658','3000',NULL),(9,6,'2012-06-05',5,'5686','8000',NULL),(10,7,'2012-06-05',2,'2500','3000',NULL),(11,8,'2012-06-05',3,'1100','1365',NULL),(14,8,'2012-06-05',3,'1650','1876',NULL);

/*Table structure for table `packing` */

DROP TABLE IF EXISTS `packing`;

CREATE TABLE `packing` (
  `PID` int(5) NOT NULL AUTO_INCREMENT,
  `PackQty` varchar(5) NOT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `packing` */

insert  into `packing`(`PID`,`PackQty`,`RecordStamp`) values (1,'1 Ltr',NULL),(2,'3.5 l',NULL),(3,'5 Ltr',NULL),(4,'7.5 L',NULL),(5,'10 Lt',NULL),(6,'20 Lt',NULL),(7,'210 L',NULL),(8,'1 Kg',NULL),(9,'2 Kg',NULL),(10,'5 Kg',NULL),(11,'20 Kg',NULL),(12,'0',NULL);

/*Table structure for table `pricehistory` */

DROP TABLE IF EXISTS `pricehistory`;

CREATE TABLE `pricehistory` (
  `DID` int(5) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date DEFAULT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DID`,`Start_Date`),
  CONSTRAINT `FK_DID` FOREIGN KEY (`DID`) REFERENCES `detaileditem` (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pricehistory` */

insert  into `pricehistory`(`DID`,`Price`,`Start_Date`,`End_Date`,`RecordStamp`) values (1,'82.00','2012-06-05',NULL,NULL),(2,'45.00','2012-06-05',NULL,NULL),(3,'85.00','2012-06-05',NULL,NULL),(4,'47.00','2012-06-05',NULL,NULL),(5,'175.00','2012-06-05','2012-06-07',NULL),(5,'180.00','2012-06-08','2012-06-11',NULL),(5,'195.00','2012-06-12',NULL,NULL),(6,'750.00','2012-06-05',NULL,NULL),(7,'1100.00','2012-06-05',NULL,NULL),(8,'210.00','2012-06-05',NULL,NULL),(9,'865.00','2012-06-05',NULL,NULL),(10,'200.00','2012-06-05',NULL,NULL),(11,'1100.00','2012-06-05',NULL,NULL),(12,'15.00','2012-06-05',NULL,NULL),(13,'35.00','2012-06-05',NULL,NULL);

/*Table structure for table `tank` */

DROP TABLE IF EXISTS `tank`;

CREATE TABLE `tank` (
  `TID` int(5) NOT NULL AUTO_INCREMENT,
  `DID` int(5) NOT NULL,
  `TC_ID` int(5) NOT NULL,
  `TankName` varchar(25) DEFAULT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TID`),
  KEY `FK_Item_Tank` (`DID`),
  KEY `FK_TC_Tank` (`TC_ID`),
  CONSTRAINT `FK_Item_Tank` FOREIGN KEY (`DID`) REFERENCES `detaileditem` (`DID`),
  CONSTRAINT `FK_TC_Tank` FOREIGN KEY (`TC_ID`) REFERENCES `tankcapacity` (`TC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tank` */

insert  into `tank`(`TID`,`DID`,`TC_ID`,`TankName`,`RecordStamp`) values (1,1,1,NULL,NULL),(2,2,1,NULL,NULL),(3,3,1,NULL,NULL),(4,4,2,NULL,NULL);

/*Table structure for table `tankcapacity` */

DROP TABLE IF EXISTS `tankcapacity`;

CREATE TABLE `tankcapacity` (
  `TC_ID` int(5) NOT NULL AUTO_INCREMENT,
  `TankCapacity` varchar(5) NOT NULL,
  `RecordStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tankcapacity` */

insert  into `tankcapacity`(`TC_ID`,`TankCapacity`,`RecordStamp`) values (1,'4 KL',NULL),(2,'8 KL',NULL),(3,'12 KL',NULL),(4,'16 KL',NULL);

/* Procedure structure for procedure `DeleteAmountFromCashier_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteAmountFromCashier_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteAmountFromCashier_Proc`(
	IN CashierID int(5),
	IN DATE DATE,
	IN TIME TIME
    )
BEGIN
	delete from AmountFromCashier  
	WHERE AmountFromCashier.Cashier_ID=CashierID && AmountFromCashier.DATE=DATE && AmountFromCashier.TIME=TIME;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteCashierFuelCreditSale_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteCashierFuelCreditSale_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCashierFuelCreditSale_Proc`(
	IN DATE DATE,
	IN CASHIERID INT(5),
	IN FUELTYPE INT(5)    
    )
BEGIN
	DELETE FROM CASHIERFUELCREDITSALE WHERE CASHIERFUELCREDITSALE.DATE = DATE &&
	CASHIERFUELCREDITSALE.CASHIER_ID = CASHIERID &&
	CASHIERFUELCREDITSALE.FUELTYPE = FUELTYPE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteDailyDip_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteDailyDip_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDailyDip_Proc`(
	IN DATE DATE,
	IN TID INT(5)
	)
BEGIN
	delete from DAILYDIP where DAILYDIP.DATE = DATE && DAILYDIP.TID = TID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteDetailedItem_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteDetailedItem_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDetailedItem_Proc`(in DID INT(5))
BEGIN
	DELETE FROM DetailedItem where DetailedItem.DID=DID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteEmployeeAttendance_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteEmployeeAttendance_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEmployeeAttendance_Proc`(IN Att_ID INT(5))
BEGIN
	DELETE FROM EMPLOYEEATTENDANCE WHERE EMPLOYEEATTENDANCE.Att_ID=Att_ID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteEmployee_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteEmployee_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEmployee_Proc`(
	IN DID int(5)
    )
BEGIN
	delete from employee where employee.DID = DID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteIndentDetails_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteIndentDetails_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteIndentDetails_Proc`(
	IN INDENT_ID INT(5)
    )
BEGIN
	DELETE FROM INDENTDETAILS WHERE INDENTDETAILS.INDENT_ID=INDENT_ID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteInventory_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteInventory_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteInventory_Proc`(IN DID INT(5))
BEGIN
	DELETE FROM INVENT WHERE INVENT.DID=DID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DELETEITEMIPDATEPRICEHIST_PROC` */

/*!50003 DROP PROCEDURE IF EXISTS  `DELETEITEMIPDATEPRICEHIST_PROC` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETEITEMIPDATEPRICEHIST_PROC`(
    IN DID INT(5),
    IN DATE DATE
    )
BEGIN
    
	DELETE FROM DETAILEDITEM WHERE DETAILEDITEM.DID=DID;
	
	UPDATE PRICEHISTORY SET PRICEHISTORY.END_DATE=DATE WHERE (PRICEHISTORY.DID=DID && ISNULL(PRICEHISTORY.END_DATE));
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteLubesale_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteLubesale_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteLubesale_Proc`(IN LS_ID INT(5))
BEGIN
	DELETE FROM LUBESALE WHERE lubesale.LS_ID=LS_ID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteNozzelSale_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteNozzelSale_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteNozzelSale_Proc`(IN NozSaleID INT(5))
BEGIN
	delete from nozzelsale where nozzelsale.NozSaleID=NozSaleID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteNozzel_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteNozzel_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteNozzel_Proc`( IN NID INT(5)
    )
BEGIN
	DELETE FROM NOZZEL WHERE NOZZEL.NID=NID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeletePacking_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeletePacking_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePacking_Proc`(IN PID INT(5))
BEGIN
	DELETE FROM PACKING WHERE PACKING.PID=PID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteTankCapacity_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteTankCapacity_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteTankCapacity_Proc`(IN TC_ID INT(5))
BEGIN
	delete from tankcapacity where tankcapacity.TC_ID=TC_ID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteTank_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteTank_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteTank_Proc`(IN TID INT(5))
BEGIN
	delete from tank where tank.TID=TID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertAmountFromCashier_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertAmountFromCashier_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAmountFromCashier_Proc`(
	IN CashierID Int(5),
	IN Date Date,
	IN Time Time,
	IN Amount numeric(10,2)	
    )
BEGIN
	Insert into amountfromcashier values(CashierID,DATE,TIME,Amount);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertCashierFuelCreditSale_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertCashierFuelCreditSale_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCashierFuelCreditSale_Proc`(
	IN DATE DATE,
	IN CashierID int(5),
	IN FuelType int(5),
	In CreditSales_Ltrs int(5)
    )
BEGIN
	INSERT INTO CASHIERFUELCREDITSALE VALUES (DATE,CashierID,FuelType,CreditSale_Ltrs);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertDailyDip_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertDailyDip_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDailyDip_Proc`(
	in DATE DATE,
	IN TID INT(5),
	IN DIP_MORNING NUMERIC(10,2),
	IN DIP_EVENING NUMERIC(10,2)
    )
BEGIN
	INSERT INTO DAILYDIP VALUES (DATE,TID,DIP_MORNING,DIP_EVENING);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertDetailedItem_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertDetailedItem_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDetailedItem_Proc`(
	in PID INT(5),
	IN DESCRIPTION VARCHAR(50),
	IN MRP NUMERIC(10,2)
    )
BEGIN
	INSERT INTO DETAILEDITEM VALUES(PID,DESCRIPTION,MRP);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertEmployeeAttendance_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertEmployeeAttendance_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertEmployeeAttendance_Proc`(
	in EID INT(5),
	IN DATE DATE,
	IN Attendance enum('Present','Absent','Half Day')
    )
BEGIN
	insert into employeeattendance VALUES (EID,DATE,Attendance);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertEmployee_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertEmployee_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertEmployee_Proc`(
	IN Emp_Name varchar(30),
	in Desig enum('Manager','Cashier','Del.Boy')
    )
BEGIN
	insert into employee values (Emp_Name,Desig);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertIndentDetails_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertIndentDetails_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertIndentDetails_Proc`(
	IN DATE DATE,
	IN ORDER_ID VARCHAR(20),
	IN MS INT(2),
	IN HSD INT(2),
	IN MS_OCT INT(2),
	IN HSD_SUPER INT(2)
    )
BEGIN
	Insert into indentdetails values (DATE,ORDER_ID,MS,HSD,MS_OCT,HSD_SUPER);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertInventory_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertInventory_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertInventory_Proc`(
	in DID INT(5),
	IN QTY INT(5)
    )
BEGIN
    INSERT INTO INVENT VALUES(DID,QTY);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `INSERTITEMPRICEHIST_PROC` */

/*!50003 DROP PROCEDURE IF EXISTS  `INSERTITEMPRICEHIST_PROC` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTITEMPRICEHIST_PROC`(
    IN DID INT(5),/*DID is MAX(DID) in DetailedItem Table*/
    IN PRICE NUMERIC(10,2),
    IN DATE DATE
    )
BEGIN
    INSERT INTO PRICEHISTORY VALUES (DID,PRICE,DATE,NULL); 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertLubesale_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertLubesale_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertLubesale_Proc`(
	
	IN DATE DATE,
	IN CASHIER_ID INT(5),
	IN SaleType enum ('Cash Sale','Credit Sale'),
	in DID int(5),
	in Qty numeric(10,2)
    )
BEGIN
	INSERT INTO LUBESALE VALUES (DATE,CASHIER_ID,SALETYPE,DID,Qty);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertNozzelSale_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertNozzelSale_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNozzelSale_Proc`(
	IN NID INT(5),
	IN DATE DATE,
	IN CASHIER_ID INT(5),
	IN OPENING NUMERIC(15,0),
	IN CLOSING NUMERIC(15,0)
    )
BEGIN
	INSERT INTO NOZZELSALE VALUES (NID,DATE,CASHIER_ID,OPENING,CLOSING);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertNozzel_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertNozzel_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNozzel_Proc`(
	IN TID INT(5),
	IN NozzelName varchar(10)
    )
BEGIN
	insert into nozzel values (TID,NozzelName);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertPacking_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertPacking_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPacking_Proc`(in PackQty varchar(5))
BEGIN
	insert into packing values(PackQty);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertTankCapacity_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertTankCapacity_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTankCapacity_Proc`(IN TANKCAP VARCHAR(5))
BEGIN
	INSERT INTO TANKCAPACITY VALUES(TANKCAP);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertTank_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertTank_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTank_Proc`(
	in DID INT(5),
	IN TC_ID INT(5),
	IN TankName varchar(25)
    )
BEGIN
	insert into tank values(DID,TC_ID,TankName);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateAmountFromCashier_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateAmountFromCashier_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateAmountFromCashier_Proc`(
	IN CashierID INT(5),
	IN DATE DATE,
	IN TIME TIME,
	IN Amount NUMERIC(10,2),
	in RecordStamp timestamp	
    )
BEGIN
    update amountfromcashier set Amountfromcashier.Amount=Amount,AmountFromCashier.RecordStamp=RecordStamp 
    where AmountFromCashier.Cashier_ID=CashierID && AmountFromCashierID.DATE=DATE && AmountFromCashier.TIME=TIME;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateCashierFuelCreditSale_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateCashierFuelCreditSale_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCashierFuelCreditSale_Proc`(
	IN DATE DATE,
	IN CASHIERID INT(5),
	IN FUELTYPE INT(5),
	IN CREDITSALE INT(5),
	IN RecordStamp timestamp
    )
BEGIN
	UPDATE CASHIERFUELCREDITSALE SET 
	CASHIERFUELCREDITSALE.CREDITSALE_LTRS = CREDITSALE,
	CASHIERFUELCREDITSALE.RECORDSTAMP=RecordStamp
	WHERE 
	CASHIERFUELCREDITSALE.DATE = DATE &&
	CASHIERFUELCREDITSALE.CASHIER_ID = CASHIERID &&
	CASHIERFUELCREDITSALE.FUELTYPE = FUELTYPE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateDailyDip_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateDailyDip_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDailyDip_Proc`(
	in DATE date,
	in TID INT(5),
	IN DIP_MORINIG NUMERIC(10,2),
	IN DIP_EVENING NUMERIC(10,2),
	in RecordStamp timestamp
    )
BEGIN
	UPDATE DAILYDIP SET 
	DAILYDIP.DIP_READINGM = DIP_MORINIG, DAILYDIP.DIP_READINGE = DIP_EVENING,DAILYDIP.RecordStamp=RecordStamp
	WHERE DAILYDIP.DATE = DATE && DAILYDIP.TID = TID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateDetailedItem_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateDetailedItem_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDetailedItem_Proc`(
	in DID INT(5),
	IN PID INT(5),
	IN DESCRIPTION VARCHAR(50),
	IN MRP NUMERIC(10,2),
	in RecordStamp timestamp
    )
BEGIN
	UPDATE DETAILEDITEM SET DETAILEDITEM.PID = PID, DETAILEDITEM.DESCRIPTION=DESCRIPTION, DETAILEDITEM.MRP=MRP,
	detaileditem.RecordStamp=RecordStamp WHERE DETAILEDITEM.DID = DID; 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateEmployeeAttendance_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateEmployeeAttendance_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateEmployeeAttendance_Proc`(
	in Att_ID INT(5),
	IN Attendance enum('Present','Absent','Half Day'),
	in RecordStamp timestamp
    )
BEGIN
	update employeeattendance set 
	employeeattendance.Attendance=Attendance, employeeattendance.recordstamp=RecordStamp
	 where employeeattendance.Att_ID=Att_ID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateEmployee_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateEmployee_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateEmployee_Proc`(
	IN EID INT(5),
	IN Emp_Name varchar(30),
	IN Desig enum('Manager','Cashier','Del.Boy'),
	in RecordStamp timestamp
    )
BEGIN
	update employee set employee.name = Emp_Name, employee.designation = desig,employee.RecordStamp=RecordStamp
	where employee.eid = eid;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateIndentDetails_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateIndentDetails_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateIndentDetails_Proc`(
	IN INDENT_ID INT(5),
	IN MS INT(2),
	IN HSD INT(2),
	IN MS_OCT INT(2),
	IN HSD_SUPER INT(2),
	IN RecordStamp TIMESTAMP
    )
BEGIN
update indentdetails set 
indentdetails.MS = MS, indentdetails.HSD = HSD, indentdetails.MSOCTANE = MS_OCT,
indentdetails.HSDSUPER = HSD_SUPER,indentdetails.recordstamp=RecordStamp WHERE indentdetails.INDENT_ID = INDENT_ID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateInventory_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateInventory_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateInventory_Proc`(
	in DID INT(5),
	IN QTY INT(5),
	IN RecordStamp TIMESTAMP
    )
BEGIN
	UPDATE INVENT SET INVENT.QTY=QTY,INVENT.RecordStamp=RecordStamp WHERE INVENT.DID=DID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UPDATEITEMPRICEHIST_PROC` */

/*!50003 DROP PROCEDURE IF EXISTS  `UPDATEITEMPRICEHIST_PROC` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATEITEMPRICEHIST_PROC`(
	IN DID INT(5),
	IN PID INT(5),
	IN DESCRIPTION VARCHAR(50),
	IN OLD_PRICE NUMERIC(10,2),
	IN NEW_PRICE NUMERIC(10,2),
	IN DATE DATE,
	IN RecordStamp timestamp
    )
BEGIN
	UPDATE DETAILEDITEM SET DETAILEDITEM.PID = PID, DETAILEDITEM.DESCRIPTION=DESCRIPTION, DETAILEDITEM.MRP=NEW_PRICE,
	detaileditem.RecordStamp=RecordStamp WHERE DETAILEDITEM.DID = DID; 
	
	IF(OLD_PRICE!=NEW_PRICE) THEN	
	UPDATE PRICEHISTORY SET PRICEHISTORY.END_DATE=DATE, PRICEHISTORY.RecordStamp=RecordStamp WHERE 
	(PRICEHISTORY.DID=DID && ISNULL(PRICEHISTORY.END_DATE));	
	INSERT INTO PRICEHISTORY VALUES (DID,NEW_PRICE,DATE+1,NULL);
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateLubesale_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateLubesale_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateLubesale_Proc`(
	IN LS_ID INT(5),
	IN DATE DATE,
	IN CASHIER_ID INT(5),
	IN SaleType ENUM ('Cash Sale','Credit Sale'),
	IN DID INT(5),
	IN Qty NUMERIC(10,2),
	IN RecordStamp TIMESTAMP
	    
    )
BEGIN
	update lubesale set  lubesale.DATE=DATE,
	lubesale.CashierID=CASHIER_ID, lubesale.SaleType=SaleType,
	lubesale.DID=DID,lubesale.Qty=Qty,lubesale.RecordStamp=RecordStamp where lubesale.LS_ID=LS_ID; 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateNozzelSale_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateNozzelSale_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateNozzelSale_Proc`(	
	in NozSaleID INT(5),
	IN NID INT(5),
	IN DATE DATE,
	IN CASHIER_ID INT(5),
	IN OPENING NUMERIC(15,0),
	IN CLOSING NUMERIC(15,0),
	IN RecordStamp TIMESTAMP    
	)
BEGIN
	UPDATE NOZZELSALE SET NOZZELSALE.DATE=DATE,
	NOZZELSALE.CASHIERID=CASHIER_ID,NOZZELSALE.OPENING=OPENING,NOZZELSALE.CLOSING=CLOSING,
	nozzelsale.RecordStamp=RecordStamp WHERE NOZZELSALE.NozSaleID=NozSaleID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateNozzel_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateNozzel_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateNozzel_Proc`(
	IN NID INT(5),
	IN TID INT(5),
	IN NozzelName VARCHAR(10),
	IN RecordStamp TIMESTAMP    
    )
BEGIN
	update nozzel set nozzel.TID=TID,nozzel.Name=NozzelName, nozzel.RecordStamp=RecordStamp where nozzel.NID=NID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdatePacking_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdatePacking_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePacking_Proc`(IN PID INT(5),IN PackQty varchar(5),
IN RecordStamp TIMESTAMP )
BEGIN
	update packing set packing.PackQty=PackQty, packing.recordstamp=RecordStamp where packing.PID=PID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateTankCapacity_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateTankCapacity_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateTankCapacity_Proc`(IN TC_ID INT(5), IN TANKCAP VARCHAR(5),
IN RecordStamp TIMESTAMP)
BEGIN
	UPDATE TANKCAPACITY SET TANKCAPACITY.TankCapacity=TANKCAP, TANKCAPACITY.RecordStamp=RecordStamp
	WHERE TANKCAPACITY.TC_ID=TC_ID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateTank_Proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateTank_Proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateTank_Proc`(	
	in TID INT(5),
	IN DID INT(5),
	IN TC_ID INT(5),
	IN TankName VARCHAR(25),
	IN RecordStamp TIMESTAMP )
BEGIN
	UPDATE TANK SET TANK.DID=DID, TANK.TC_ID=TC_ID,TANK.TANKNAME=TankName,Tank.RecordStamp=RecordStamp
	where tank.tid=TID;
    END */$$
DELIMITER ;

/*Table structure for table `amountfromcashier_view` */

DROP TABLE IF EXISTS `amountfromcashier_view`;

/*!50001 DROP VIEW IF EXISTS `amountfromcashier_view` */;
/*!50001 DROP TABLE IF EXISTS `amountfromcashier_view` */;

/*!50001 CREATE TABLE  `amountfromcashier_view`(
 `CASHIER_ID` int(5) ,
 `Name` varchar(30) ,
 `DATE` date ,
 `TIME` time ,
 `AMOUNT` decimal(10,2) 
)*/;

/*Table structure for table `cashfuelsales_view` */

DROP TABLE IF EXISTS `cashfuelsales_view`;

/*!50001 DROP VIEW IF EXISTS `cashfuelsales_view` */;
/*!50001 DROP TABLE IF EXISTS `cashfuelsales_view` */;

/*!50001 CREATE TABLE  `cashfuelsales_view`(
 `Date` date ,
 `Cashier_ID` int(5) ,
 `Name` varchar(30) ,
 `FuelType` int(5) ,
 `Description` varchar(50) ,
 `LtrsSOLD` decimal(38,0) ,
 `CreditSale_Ltrs` int(5) ,
 `CashSaleAmount` decimal(49,2) 
)*/;

/*Table structure for table `dailycashierwisecash_fuel_view` */

DROP TABLE IF EXISTS `dailycashierwisecash_fuel_view`;

/*!50001 DROP VIEW IF EXISTS `dailycashierwisecash_fuel_view` */;
/*!50001 DROP TABLE IF EXISTS `dailycashierwisecash_fuel_view` */;

/*!50001 CREATE TABLE  `dailycashierwisecash_fuel_view`(
 `CASHIERID` int(5) ,
 `CASHIER` varchar(30) ,
 `DATE` date ,
 `TotalCashSale` decimal(65,2) 
)*/;

/*Table structure for table `dailycashierwiselube_view` */

DROP TABLE IF EXISTS `dailycashierwiselube_view`;

/*!50001 DROP VIEW IF EXISTS `dailycashierwiselube_view` */;
/*!50001 DROP TABLE IF EXISTS `dailycashierwiselube_view` */;

/*!50001 CREATE TABLE  `dailycashierwiselube_view`(
 `CASHIERID` int(5) ,
 `NAME` varchar(30) ,
 `DATE` date ,
 `TotalSale` decimal(42,4) 
)*/;

/*Table structure for table `dailydip_view` */

DROP TABLE IF EXISTS `dailydip_view`;

/*!50001 DROP VIEW IF EXISTS `dailydip_view` */;
/*!50001 DROP TABLE IF EXISTS `dailydip_view` */;

/*!50001 CREATE TABLE  `dailydip_view`(
 `Date` date ,
 `TID` int(5) ,
 `DIP_READINGM` decimal(10,2) ,
 `DIPMORNING` decimal(10,2) ,
 `DIP_READINGE` decimal(10,2) ,
 `DIPEVENING` decimal(10,2) 
)*/;

/*Table structure for table `dcr_view` */

DROP TABLE IF EXISTS `dcr_view`;

/*!50001 DROP VIEW IF EXISTS `dcr_view` */;
/*!50001 DROP TABLE IF EXISTS `dcr_view` */;

/*!50001 CREATE TABLE  `dcr_view`(
 `Date` date ,
 `Cashierid` int(5) ,
 `Cashier` varchar(30) ,
 `FuelCashSale` decimal(65,2) ,
 `LubeCashSale` decimal(42,4) ,
 `TotalCashSales` decimal(65,4) ,
 `AmountFromCashier` decimal(32,2) 
)*/;

/*Table structure for table `detaileditem_view` */

DROP TABLE IF EXISTS `detaileditem_view`;

/*!50001 DROP VIEW IF EXISTS `detaileditem_view` */;
/*!50001 DROP TABLE IF EXISTS `detaileditem_view` */;

/*!50001 CREATE TABLE  `detaileditem_view`(
 `DID` int(5) ,
 `PID` int(5) ,
 `PackQty` varchar(5) ,
 `DESCRIPTION` varchar(50) ,
 `MRP` double(10,2) 
)*/;

/*Table structure for table `eveningdip_view` */

DROP TABLE IF EXISTS `eveningdip_view`;

/*!50001 DROP VIEW IF EXISTS `eveningdip_view` */;
/*!50001 DROP TABLE IF EXISTS `eveningdip_view` */;

/*!50001 CREATE TABLE  `eveningdip_view`(
 `Date` date ,
 `TID` int(5) ,
 `DIP_READINGE` decimal(10,2) ,
 `DipEvening` decimal(10,2) 
)*/;

/*Table structure for table `fuelcashiercreditsale_view` */

DROP TABLE IF EXISTS `fuelcashiercreditsale_view`;

/*!50001 DROP VIEW IF EXISTS `fuelcashiercreditsale_view` */;
/*!50001 DROP TABLE IF EXISTS `fuelcashiercreditsale_view` */;

/*!50001 CREATE TABLE  `fuelcashiercreditsale_view`(
 `Date` date ,
 `Cashier_id` int(5) ,
 `nAME` varchar(30) ,
 `FuelType` int(5) ,
 `Description` varchar(50) ,
 `CreditSale_Ltrs` int(5) ,
 `CreditSaleAmount` decimal(20,2) 
)*/;

/*Table structure for table `fws_cashier_view` */

DROP TABLE IF EXISTS `fws_cashier_view`;

/*!50001 DROP VIEW IF EXISTS `fws_cashier_view` */;
/*!50001 DROP TABLE IF EXISTS `fws_cashier_view` */;

/*!50001 CREATE TABLE  `fws_cashier_view`(
 `FuelType` varchar(50) ,
 `CashierID` int(5) ,
 `Cashier` varchar(30) ,
 `Date` date ,
 `LtrsSold` decimal(38,0) ,
 `TotalSaleAmount` decimal(48,2) 
)*/;

/*Table structure for table `indentdetails_view` */

DROP TABLE IF EXISTS `indentdetails_view`;

/*!50001 DROP VIEW IF EXISTS `indentdetails_view` */;
/*!50001 DROP TABLE IF EXISTS `indentdetails_view` */;

/*!50001 CREATE TABLE  `indentdetails_view`(
 `DATE` date ,
 `Order_ID` varchar(20) ,
 `MS` int(2) ,
 `HSD` int(2) ,
 `MSOCTANE` int(2) ,
 `HSDSUPER` int(2) 
)*/;

/*Table structure for table `inventory_view` */

DROP TABLE IF EXISTS `inventory_view`;

/*!50001 DROP VIEW IF EXISTS `inventory_view` */;
/*!50001 DROP TABLE IF EXISTS `inventory_view` */;

/*!50001 CREATE TABLE  `inventory_view`(
 `DID` int(5) ,
 `Description` varchar(50) ,
 `PackQty` varchar(5) ,
 `Qty` int(5) 
)*/;

/*Table structure for table `lubesale_view` */

DROP TABLE IF EXISTS `lubesale_view`;

/*!50001 DROP VIEW IF EXISTS `lubesale_view` */;
/*!50001 DROP TABLE IF EXISTS `lubesale_view` */;

/*!50001 CREATE TABLE  `lubesale_view`(
 `LS_ID` int(5) ,
 `date` date ,
 `CashierID` int(5) ,
 `NAME` varchar(30) ,
 `SaleType` enum('Cash Sale','Credit Sale') ,
 `DID` int(5) ,
 `Description` varchar(50) ,
 `Qty` decimal(10,2) ,
 `Amount` decimal(20,4) 
)*/;

/*Table structure for table `morningdip_view` */

DROP TABLE IF EXISTS `morningdip_view`;

/*!50001 DROP VIEW IF EXISTS `morningdip_view` */;
/*!50001 DROP TABLE IF EXISTS `morningdip_view` */;

/*!50001 CREATE TABLE  `morningdip_view`(
 `Date` date ,
 `TID` int(5) ,
 `DIP_READINGM` decimal(10,2) ,
 `DipMorning` decimal(10,2) 
)*/;

/*Table structure for table `nozzeldetails_view` */

DROP TABLE IF EXISTS `nozzeldetails_view`;

/*!50001 DROP VIEW IF EXISTS `nozzeldetails_view` */;
/*!50001 DROP TABLE IF EXISTS `nozzeldetails_view` */;

/*!50001 CREATE TABLE  `nozzeldetails_view`(
 `NID` int(5) ,
 `FuelType` varchar(50) ,
 `TID` int(5) ,
 `TANKNAME` varchar(25) ,
 `NAME` varchar(10) 
)*/;

/*Table structure for table `nozzelsale_view` */

DROP TABLE IF EXISTS `nozzelsale_view`;

/*!50001 DROP VIEW IF EXISTS `nozzelsale_view` */;
/*!50001 DROP TABLE IF EXISTS `nozzelsale_view` */;

/*!50001 CREATE TABLE  `nozzelsale_view`(
 `NozSaleID` int(5) ,
 `NID` int(5) ,
 `Date` date ,
 `Name` varchar(10) ,
 `CashierID` int(5) ,
 `Cashier` varchar(30) ,
 `FuelType` varchar(50) ,
 `Opening` decimal(15,0) ,
 `Closing` decimal(15,0) ,
 `LtrsSold` decimal(16,0) ,
 `TotalSaleAmount` decimal(26,2) 
)*/;

/*Table structure for table `prodtorefill_view` */

DROP TABLE IF EXISTS `prodtorefill_view`;

/*!50001 DROP VIEW IF EXISTS `prodtorefill_view` */;
/*!50001 DROP TABLE IF EXISTS `prodtorefill_view` */;

/*!50001 CREATE TABLE  `prodtorefill_view`(
 `Description` varchar(50) ,
 `PackQty` varchar(5) ,
 `Qty` int(5) 
)*/;

/*Table structure for table `tankdetails_view` */

DROP TABLE IF EXISTS `tankdetails_view`;

/*!50001 DROP VIEW IF EXISTS `tankdetails_view` */;
/*!50001 DROP TABLE IF EXISTS `tankdetails_view` */;

/*!50001 CREATE TABLE  `tankdetails_view`(
 `TID` int(5) ,
 `TankName` varchar(25) ,
 `FuelType` varchar(50) ,
 `TankCapacity` varchar(5) 
)*/;

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

/*!50001 DROP VIEW IF EXISTS `test` */;
/*!50001 DROP TABLE IF EXISTS `test` */;

/*!50001 CREATE TABLE  `test`(
 `dATE` date ,
 `DID` int(5) ,
 `Description` varchar(50) ,
 `Qty` decimal(10,2) ,
 `Amount` decimal(20,4) 
)*/;

/*Table structure for table `totalfuelsale_view` */

DROP TABLE IF EXISTS `totalfuelsale_view`;

/*!50001 DROP VIEW IF EXISTS `totalfuelsale_view` */;
/*!50001 DROP TABLE IF EXISTS `totalfuelsale_view` */;

/*!50001 CREATE TABLE  `totalfuelsale_view`(
 `FuelType` varchar(50) ,
 `Date` date ,
 `LtrsSold` decimal(60,0) ,
 `TotalSaleAmount` decimal(65,2) 
)*/;

/*View structure for view amountfromcashier_view */

/*!50001 DROP TABLE IF EXISTS `amountfromcashier_view` */;
/*!50001 DROP VIEW IF EXISTS `amountfromcashier_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `amountfromcashier_view` AS (select `a`.`Cashier_ID` AS `CASHIER_ID`,`e`.`Name` AS `Name`,`a`.`Date` AS `DATE`,`a`.`Time` AS `TIME`,`a`.`Amount` AS `AMOUNT` from (`amountfromcashier` `a` join `employee` `e` on((`a`.`Cashier_ID` = `e`.`EID`))) order by `a`.`Time`,`a`.`Date`) */;

/*View structure for view cashfuelsales_view */

/*!50001 DROP TABLE IF EXISTS `cashfuelsales_view` */;
/*!50001 DROP VIEW IF EXISTS `cashfuelsales_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cashfuelsales_view` AS (select `c`.`Date` AS `Date`,`c`.`Cashier_ID` AS `Cashier_ID`,`e`.`Name` AS `Name`,`c`.`FuelType` AS `FuelType`,`i`.`Description` AS `Description`,`f`.`LtrsSold` AS `LtrsSOLD`,`c`.`CreditSale_Ltrs` AS `CreditSale_Ltrs`,(select ((`f`.`LtrsSold` - `c`.`CreditSale_Ltrs`) * `p`.`Price`)) AS `CashSaleAmount` from ((((`cashierfuelcreditsale` `c` join `employee` `e` on((`c`.`Cashier_ID` = `e`.`EID`))) join `detaileditem` `i` on((`c`.`FuelType` = `i`.`DID`))) join `fws_cashier_view` `f` on(((`c`.`Date` = `f`.`Date`) and (`c`.`Cashier_ID` = `f`.`CashierID`) and (`i`.`Description` = `f`.`FuelType`)))) join `pricehistory` `p` on((`p`.`DID` = `i`.`DID`))) where (((`c`.`Date` >= `p`.`Start_Date`) and (`c`.`Date` <= `p`.`End_Date`)) or ((`c`.`Date` >= `p`.`Start_Date`) and isnull(`p`.`End_Date`)))) */;

/*View structure for view dailycashierwisecash_fuel_view */

/*!50001 DROP TABLE IF EXISTS `dailycashierwisecash_fuel_view` */;
/*!50001 DROP VIEW IF EXISTS `dailycashierwisecash_fuel_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dailycashierwisecash_fuel_view` AS (select `cashfuelsales_view`.`Cashier_ID` AS `CASHIERID`,`cashfuelsales_view`.`Name` AS `CASHIER`,`cashfuelsales_view`.`Date` AS `DATE`,sum(`cashfuelsales_view`.`CashSaleAmount`) AS `TotalCashSale` from `cashfuelsales_view` group by `cashfuelsales_view`.`Cashier_ID`,`cashfuelsales_view`.`Date`) */;

/*View structure for view dailycashierwiselube_view */

/*!50001 DROP TABLE IF EXISTS `dailycashierwiselube_view` */;
/*!50001 DROP VIEW IF EXISTS `dailycashierwiselube_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dailycashierwiselube_view` AS (select `lubesale_view`.`CashierID` AS `CASHIERID`,`lubesale_view`.`NAME` AS `NAME`,`lubesale_view`.`date` AS `DATE`,sum(`lubesale_view`.`Amount`) AS `TotalSale` from `lubesale_view` where (`lubesale_view`.`SaleType` = 'CASH SALE') group by `lubesale_view`.`CashierID`,`lubesale_view`.`date`) */;

/*View structure for view dailydip_view */

/*!50001 DROP TABLE IF EXISTS `dailydip_view` */;
/*!50001 DROP VIEW IF EXISTS `dailydip_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dailydip_view` AS (select `m`.`Date` AS `Date`,`m`.`TID` AS `TID`,`m`.`DIP_READINGM` AS `DIP_READINGM`,`m`.`DipMorning` AS `DIPMORNING`,`e`.`DIP_READINGE` AS `DIP_READINGE`,`e`.`DipEvening` AS `DIPEVENING` from (`morningdip_view` `m` join `eveningdip_view` `e` on(((`m`.`Date` = `e`.`Date`) and (`m`.`TID` = `e`.`TID`))))) */;

/*View structure for view dcr_view */

/*!50001 DROP TABLE IF EXISTS `dcr_view` */;
/*!50001 DROP VIEW IF EXISTS `dcr_view` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dcr_view` AS (select `f`.`DATE` AS `Date`,`f`.`CASHIERID` AS `Cashierid`,`f`.`CASHIER` AS `Cashier`,`f`.`TotalCashSale` AS `FuelCashSale`,`l`.`TotalSale` AS `LubeCashSale`,(select (`f`.`TotalCashSale` + `l`.`TotalSale`)) AS `TotalCashSales`,(select sum(`a`.`Amount`)) AS `AmountFromCashier` from ((`dailycashierwisecash_fuel_view` `f` join `dailycashierwiselube_view` `l` on(((`f`.`CASHIERID` = `l`.`CASHIERID`) and (`f`.`DATE` = `l`.`DATE`)))) join `amountfromcashier` `a` on(((`f`.`DATE` = `a`.`Date`) and (`a`.`Cashier_ID` = `f`.`CASHIERID`)))) group by `f`.`CASHIERID`) */;

/*View structure for view detaileditem_view */

/*!50001 DROP TABLE IF EXISTS `detaileditem_view` */;
/*!50001 DROP VIEW IF EXISTS `detaileditem_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detaileditem_view` AS (select `i`.`DID` AS `DID`,`i`.`PID` AS `PID`,`p`.`PackQty` AS `PackQty`,`i`.`Description` AS `DESCRIPTION`,`i`.`MRP` AS `MRP` from (`detaileditem` `i` join `packing` `p` on((`i`.`PID` = `p`.`PID`))) order by `i`.`DID`) */;

/*View structure for view eveningdip_view */

/*!50001 DROP TABLE IF EXISTS `eveningdip_view` */;
/*!50001 DROP VIEW IF EXISTS `eveningdip_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eveningdip_view` AS (select `dailydip`.`Date` AS `Date`,`dailydip`.`TID` AS `TID`,`dailydip`.`DIP_READINGE` AS `DIP_READINGE`,`dip`.`DIP_Value` AS `DipEvening` from ((`dailydip` join `dip` on((`dip`.`DIP_ID` = `dailydip`.`DIP_READINGE`))) join `tank` on(((`tank`.`TC_ID` = `dip`.`TC_ID`) and (`dailydip`.`TID` = `tank`.`TID`))))) */;

/*View structure for view fuelcashiercreditsale_view */

/*!50001 DROP TABLE IF EXISTS `fuelcashiercreditsale_view` */;
/*!50001 DROP VIEW IF EXISTS `fuelcashiercreditsale_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fuelcashiercreditsale_view` AS (select `c`.`Date` AS `Date`,`c`.`Cashier_ID` AS `Cashier_id`,`e`.`Name` AS `nAME`,`c`.`FuelType` AS `FuelType`,`i`.`Description` AS `Description`,`c`.`CreditSale_Ltrs` AS `CreditSale_Ltrs`,(select (`c`.`CreditSale_Ltrs` * `p`.`Price`)) AS `CreditSaleAmount` from (((`cashierfuelcreditsale` `c` join `employee` `e` on((`c`.`Cashier_ID` = `e`.`EID`))) join `detaileditem` `i` on((`c`.`FuelType` = `i`.`DID`))) join `pricehistory` `p` on((`p`.`DID` = `i`.`DID`))) where (((`c`.`Date` >= `p`.`Start_Date`) and (`c`.`Date` <= `p`.`End_Date`)) or ((`c`.`Date` >= `p`.`Start_Date`) and isnull(`p`.`End_Date`))) order by `c`.`Date`,`c`.`FuelType`) */;

/*View structure for view fws_cashier_view */

/*!50001 DROP TABLE IF EXISTS `fws_cashier_view` */;
/*!50001 DROP VIEW IF EXISTS `fws_cashier_view` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fws_cashier_view` AS (select `n`.`FuelType` AS `FuelType`,`n`.`CashierID` AS `CashierID`,`n`.`Cashier` AS `Cashier`,`n`.`Date` AS `Date`,sum(`n`.`LtrsSold`) AS `LtrsSold`,sum(`n`.`TotalSaleAmount`) AS `TotalSaleAmount` from `nozzelsale_view` `n` group by `n`.`CashierID`,`n`.`Date`,`n`.`FuelType` order by `n`.`Date`) */;

/*View structure for view indentdetails_view */

/*!50001 DROP TABLE IF EXISTS `indentdetails_view` */;
/*!50001 DROP VIEW IF EXISTS `indentdetails_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `indentdetails_view` AS (select `indentdetails`.`Date` AS `DATE`,`indentdetails`.`Order_ID` AS `Order_ID`,`indentdetails`.`MS` AS `MS`,`indentdetails`.`HSD` AS `HSD`,`indentdetails`.`MSOctane` AS `MSOCTANE`,`indentdetails`.`HSDSuper` AS `HSDSUPER` from `indentdetails`) */;

/*View structure for view inventory_view */

/*!50001 DROP TABLE IF EXISTS `inventory_view` */;
/*!50001 DROP VIEW IF EXISTS `inventory_view` */;

/*!50001 CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inventory_view` AS (select `inv`.`DID` AS `DID`,`i`.`Description` AS `Description`,`p`.`PackQty` AS `PackQty`,`inv`.`Qty` AS `Qty` from ((`invent` `inv` join `detaileditem` `i` on((`inv`.`DID` = `i`.`DID`))) join `packing` `p` on((`i`.`PID` = `p`.`PID`)))) */;

/*View structure for view lubesale_view */

/*!50001 DROP TABLE IF EXISTS `lubesale_view` */;
/*!50001 DROP VIEW IF EXISTS `lubesale_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lubesale_view` AS (select `l`.`LS_ID` AS `LS_ID`,`l`.`Date` AS `date`,`l`.`CashierID` AS `CashierID`,`e`.`Name` AS `NAME`,`l`.`SaleType` AS `SaleType`,`l`.`DID` AS `DID`,`i`.`Description` AS `Description`,`l`.`Qty` AS `Qty`,(select (`l`.`Qty` * `p`.`Price`)) AS `Amount` from (((`lubesale` `l` join `employee` `e` on((`l`.`CashierID` = `e`.`EID`))) join `detaileditem` `i` on((`l`.`DID` = `i`.`DID`))) join `pricehistory` `p` on((`p`.`DID` = `i`.`DID`))) where (((`l`.`Date` >= `p`.`Start_Date`) and (`l`.`Date` <= `p`.`End_Date`)) or ((`l`.`Date` >= `p`.`Start_Date`) and isnull(`p`.`End_Date`)))) */;

/*View structure for view morningdip_view */

/*!50001 DROP TABLE IF EXISTS `morningdip_view` */;
/*!50001 DROP VIEW IF EXISTS `morningdip_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `morningdip_view` AS (select `dailydip`.`Date` AS `Date`,`dailydip`.`TID` AS `TID`,`dailydip`.`DIP_READINGM` AS `DIP_READINGM`,`dip`.`DIP_Value` AS `DipMorning` from ((`dailydip` join `dip` on((`dip`.`DIP_ID` = `dailydip`.`DIP_READINGM`))) join `tank` on(((`tank`.`TC_ID` = `dip`.`TC_ID`) and (`dailydip`.`TID` = `tank`.`TID`))))) */;

/*View structure for view nozzeldetails_view */

/*!50001 DROP TABLE IF EXISTS `nozzeldetails_view` */;
/*!50001 DROP VIEW IF EXISTS `nozzeldetails_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nozzeldetails_view` AS (select `n`.`NID` AS `NID`,`i`.`Description` AS `FuelType`,`n`.`TID` AS `TID`,`t`.`TankName` AS `TANKNAME`,`n`.`Name` AS `NAME` from ((`nozzel` `n` join `tank` `t` on((`n`.`TID` = `t`.`TID`))) join `detaileditem` `i` on((`t`.`DID` = `i`.`DID`)))) */;

/*View structure for view nozzelsale_view */

/*!50001 DROP TABLE IF EXISTS `nozzelsale_view` */;
/*!50001 DROP VIEW IF EXISTS `nozzelsale_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nozzelsale_view` AS (select `n`.`NozSaleID` AS `NozSaleID`,`n`.`NID` AS `NID`,`n`.`Date` AS `Date`,`noz`.`Name` AS `Name`,`e`.`EID` AS `CashierID`,`e`.`Name` AS `Cashier`,`i`.`Description` AS `FuelType`,`n`.`Opening` AS `Opening`,`n`.`Closing` AS `Closing`,(select (`n`.`Closing` - `n`.`Opening`)) AS `LtrsSold`,(select (`LtrsSold` * `p`.`Price`)) AS `TotalSaleAmount` from (((((`nozzelsale` `n` join `nozzel` `noz` on((`n`.`NID` = `noz`.`NID`))) join `tank` `t` on((`t`.`TID` = `noz`.`TID`))) join `detaileditem` `i` on((`t`.`DID` = `i`.`DID`))) join `employee` `e` on((`e`.`EID` = `n`.`CashierID`))) join `pricehistory` `p` on((`p`.`DID` = `i`.`DID`))) where (((`n`.`Date` >= `p`.`Start_Date`) and (`n`.`Date` <= `p`.`End_Date`)) or ((`n`.`Date` >= `p`.`Start_Date`) and isnull(`p`.`End_Date`)))) */;

/*View structure for view prodtorefill_view */

/*!50001 DROP TABLE IF EXISTS `prodtorefill_view` */;
/*!50001 DROP VIEW IF EXISTS `prodtorefill_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prodtorefill_view` AS (select `inventory_view`.`Description` AS `Description`,`inventory_view`.`PackQty` AS `PackQty`,`inventory_view`.`Qty` AS `Qty` from `inventory_view` having (`inventory_view`.`Qty` <= 3)) */;

/*View structure for view tankdetails_view */

/*!50001 DROP TABLE IF EXISTS `tankdetails_view` */;
/*!50001 DROP VIEW IF EXISTS `tankdetails_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tankdetails_view` AS (select `t`.`TID` AS `TID`,`t`.`TankName` AS `TankName`,`i`.`Description` AS `FuelType`,`tc`.`TankCapacity` AS `TankCapacity` from ((`tank` `t` join `detaileditem` `i` on((`t`.`DID` = `i`.`DID`))) join `tankcapacity` `tc` on((`tc`.`TC_ID` = `t`.`TC_ID`)))) */;

/*View structure for view test */

/*!50001 DROP TABLE IF EXISTS `test` */;
/*!50001 DROP VIEW IF EXISTS `test` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `test` AS (select `l`.`Date` AS `dATE`,`l`.`DID` AS `DID`,`i`.`Description` AS `Description`,`l`.`Qty` AS `Qty`,(select (`l`.`Qty` * `p`.`Price`)) AS `Amount` from ((`lubesale` `l` join `detaileditem` `i` on((`l`.`DID` = `i`.`DID`))) join `pricehistory` `p` on((`p`.`DID` = `l`.`DID`))) where (((`l`.`Date` >= `p`.`Start_Date`) and (`l`.`Date` <= `p`.`End_Date`)) or ((`l`.`Date` >= `p`.`Start_Date`) and isnull(`p`.`End_Date`)))) */;

/*View structure for view totalfuelsale_view */

/*!50001 DROP TABLE IF EXISTS `totalfuelsale_view` */;
/*!50001 DROP VIEW IF EXISTS `totalfuelsale_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `totalfuelsale_view` AS (select `fws_cashier_view`.`FuelType` AS `FuelType`,`fws_cashier_view`.`Date` AS `Date`,sum(`fws_cashier_view`.`LtrsSold`) AS `LtrsSold`,sum(`fws_cashier_view`.`TotalSaleAmount`) AS `TotalSaleAmount` from `fws_cashier_view` group by `fws_cashier_view`.`FuelType`,`fws_cashier_view`.`Date`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
