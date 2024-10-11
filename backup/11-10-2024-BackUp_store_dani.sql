/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - store_dani
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`store_dani` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `store_dani`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) DEFAULT NULL,
  `description` TINYTEXT DEFAULT NULL,
  `uuid` CHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=INNODB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `category` */

INSERT  INTO `category`(`id`,`name`,`description`,`uuid`) VALUES 
(10,'granos','granos como arroz, frijol, arveja..','2fe05665-87e5-11ef-9451-0ae0afa00364'),
(11,'Bedidas enbotelladas','bebidas de todo tipo consumo humano','2fe166ca-87e5-11ef-9451-0ae0afa00364'),
(12,'frutas y verduras','verduras y demas naturales','2fe16828-87e5-11ef-9451-0ae0afa00364'),
(13,'carnes','carnes de cerdo, res, pollo y demas\n','2fe168c6-87e5-11ef-9451-0ae0afa00364'),
(14,'abarrotes','productos generales de uso diario','2fe1695d-87e5-11ef-9451-0ae0afa00364'),
(15,'mascotas','alimentos para mascotas','2fe169f3-87e5-11ef-9451-0ae0afa00364'),
(16,'mecato xunidad','mecato por paquetes unitarios','2fe16a96-87e5-11ef-9451-0ae0afa00364'),
(17,'ropa','ropas de todo tipo','2fe16b2d-87e5-11ef-9451-0ae0afa00364');

/*Table structure for table `documenttype` */

DROP TABLE IF EXISTS `documenttype`;

CREATE TABLE `documenttype` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) DEFAULT NULL,
  `uuid` CHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `documenttype` */

INSERT  INTO `documenttype`(`id`,`type`,`uuid`) VALUES 
(4,'T.I','5edbe3a6-8804-11ef-ade4-0ae0afa00364'),
(5,'C.C','5edbe5dc-8804-11ef-ade4-0ae0afa00364'),
(6,'C.E','5edbe67d-8804-11ef-ade4-0ae0afa00364');

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `statusId` INT(20) DEFAULT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `updatedAt` DATETIME DEFAULT NULL,
  `peopleId` INT(20) DEFAULT NULL,
  `uuid` CHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `statusId` (`statusId`),
  KEY `peopleId` (`peopleId`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `invoicestatus` (`id`),
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoice` */

INSERT  INTO `invoice`(`id`,`statusId`,`createdAt`,`updatedAt`,`peopleId`,`uuid`) VALUES 
(1,1,'2024-10-11 14:37:58',NULL,1,'51f3c79f-8808-11ef-ade4-0ae0afa00364'),
(2,2,'2024-10-11 14:38:24',NULL,1,'61648a95-8808-11ef-ade4-0ae0afa00364');

/*Table structure for table `invoiceproduct` */

DROP TABLE IF EXISTS `invoiceproduct`;

CREATE TABLE `invoiceproduct` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `productId` INT(20) DEFAULT NULL,
  `invoiceId` INT(20) DEFAULT NULL,
  `uuid` CHAR(36) DEFAULT NULL,
  `cant` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `productId` (`productId`),
  KEY `invoiceId` (`invoiceId`),
  CONSTRAINT `invoiceproduct_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `invoiceproduct_ibfk_2` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoiceproduct` */

INSERT  INTO `invoiceproduct`(`id`,`productId`,`invoiceId`,`uuid`,`cant`) VALUES 
(1,11,1,'aa1651a3-880b-11ef-ade4-0ae0afa00364',2);

/*Table structure for table `invoicestatus` */

DROP TABLE IF EXISTS `invoicestatus`;

CREATE TABLE `invoicestatus` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) DEFAULT NULL,
  `description` TINYTEXT DEFAULT NULL,
  `uuid` CHAR(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `uuid_2` (`uuid`),
  UNIQUE KEY `uuid_3` (`uuid`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoicestatus` */

INSERT  INTO `invoicestatus`(`id`,`name`,`description`,`uuid`) VALUES 
(1,'pagado',NULL,'7c5bf6dd-880d-11ef-ade4-0ae0afa00364'),
(2,'cancelado',NULL,'841f461f-880d-11ef-ade4-0ae0afa00364');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `invoiceId` INT(20) DEFAULT NULL,
  `statusId` INT(20) DEFAULT NULL,
  `details` TINYTEXT DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoiceId` (`invoiceId`),
  KEY `statusId` (`statusId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `orderstatus` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `order` */

/*Table structure for table `orderstatus` */

DROP TABLE IF EXISTS `orderstatus`;

CREATE TABLE `orderstatus` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `orderstatus` */

/*Table structure for table `people` */

DROP TABLE IF EXISTS `people`;

CREATE TABLE `people` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(30) DEFAULT NULL,
  `lastName` VARCHAR(30) DEFAULT NULL,
  `address` VARCHAR(70) DEFAULT NULL,
  `documentTypeId` INT(20) DEFAULT NULL,
  `documentNumber` VARCHAR(12) DEFAULT NULL,
  `phone` VARCHAR(12) DEFAULT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `updatedAt` DATETIME DEFAULT NULL,
  `isActive` TINYINT(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `documentTypeId` (`documentTypeId`),
  CONSTRAINT `people_ibfk_1` FOREIGN KEY (`documentTypeId`) REFERENCES `documenttype` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `people` */

INSERT  INTO `people`(`id`,`firstName`,`lastName`,`address`,`documentTypeId`,`documentNumber`,`phone`,`createdAt`,`updatedAt`,`isActive`) VALUES 
(1,'Juan','Perez','Calle 45 22-33',4,'1234567890','32132145','2024-10-10 16:33:31','2024-10-10 16:33:31',0),
(2,'Camilo','Rendon','Vereda Palermo norte',5,'12536842','3215324830','2024-10-10 16:33:35','2024-10-10 16:33:35',1),
(3,'Camilo','Calderon','calle 5 #3 sur',5,'1256891','3227569852','2024-10-10 16:33:32','2024-10-10 16:33:32',1),
(4,'Sarah','mandrogan','centro',5,'1245002','3226440156','2024-10-05 16:57:18',NULL,0);

/*Table structure for table `peoplerol` */

DROP TABLE IF EXISTS `peoplerol`;

CREATE TABLE `peoplerol` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `peopleId` INT(20) DEFAULT NULL,
  `rolId` INT(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peopleId` (`peopleId`),
  KEY `rolId` (`rolId`),
  CONSTRAINT `peoplerol_ibfk_1` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`),
  CONSTRAINT `peoplerol_ibfk_2` FOREIGN KEY (`rolId`) REFERENCES `roles` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `peoplerol` */

INSERT  INTO `peoplerol`(`id`,`peopleId`,`rolId`) VALUES 
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,2);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) DEFAULT NULL,
  `stock` INT(11) DEFAULT NULL,
  `price` FLOAT DEFAULT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updatedAt` DATETIME DEFAULT NULL,
  `isActive` TINYINT(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `product` */

INSERT  INTO `product`(`id`,`name`,`stock`,`price`,`createdAt`,`updatedAt`,`isActive`) VALUES 
(2,'Leche',25,4000,'2024-10-02 10:01:00','2024-10-02 10:01:00',1),
(3,'Pollo (kg)',15,8000,'2024-10-02 10:02:00','2024-10-02 10:02:00',1),
(4,'Carne de Res (kg)',10,18000,'2024-10-02 10:03:00','2024-10-02 10:03:00',1),
(5,'Manzana (unidad)',50,2000,'2024-10-02 10:04:00','2024-10-02 10:04:00',1),
(6,'Jugo (botella)',20,3000,'2024-10-02 10:05:00','2024-10-02 10:05:00',1),
(7,'Huevo (docena)',30,5000,'2024-10-02 10:06:00','2024-10-02 10:06:00',1),
(8,'Tetra Pak',40,3000,'2024-10-02 10:07:00','2024-10-02 10:07:00',1),
(9,'Hueso perro',10,2500,'2024-10-02 10:08:00','2024-10-02 10:08:00',1),
(11,'Galletas xunidad',18,1200,'2024-10-02 16:33:00',NULL,1),
(12,'agua xL(botella)',18,1500,'2024-10-03 21:26:59',NULL,1),
(14,'Arroz 1000g',10,4500,'2024-10-10 16:35:32',NULL,1);

/*Table structure for table `productcategory` */

DROP TABLE IF EXISTS `productcategory`;

CREATE TABLE `productcategory` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `categoryId` INT(20) DEFAULT NULL,
  `productId` INT(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  KEY `productId` (`productId`),
  CONSTRAINT `productcategory_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `productcategory_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productcategory` */

INSERT  INTO `productcategory`(`id`,`categoryId`,`productId`) VALUES 
(29,11,2),
(30,16,3),
(31,13,4),
(32,12,5),
(33,11,6),
(34,15,7),
(35,14,8),
(36,15,9),
(38,16,11),
(39,11,12),
(41,10,14);

/*Table structure for table `productdesc` */

DROP TABLE IF EXISTS `productdesc`;

CREATE TABLE `productdesc` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `productId` INT(20) DEFAULT NULL,
  `discount` TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  CONSTRAINT `productdesc_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productdesc` */

/*Table structure for table `productsupplier` */

DROP TABLE IF EXISTS `productsupplier`;

CREATE TABLE `productsupplier` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `productId` INT(20) DEFAULT NULL,
  `peopleId` INT(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `peopleId` (`peopleId`),
  CONSTRAINT `productsupplier_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `productsupplier_ibfk_2` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productsupplier` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) DEFAULT NULL,
  `description` TINYTEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

INSERT  INTO `roles`(`id`,`name`,`description`) VALUES 
(1,'clientes',NULL),
(2,'Vendedor',NULL);

/*Table structure for table `seller` */

DROP TABLE IF EXISTS `seller`;

CREATE TABLE `seller` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `updatedAt` DATETIME DEFAULT NULL,
  `peopleId` INT(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peopleId` (`peopleId`),
  CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`peopleId`) REFERENCES `people` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `seller` */

/* Trigger structure for table `category` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_category` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_category` BEFORE INSERT ON `category` FOR EACH ROW 
begin
	IF NEW.uuid IS NULL OR NEW.uuid ='' THEN 
		SET NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `documenttype` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_typeDni` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_typeDni` BEFORE INSERT ON `documenttype` FOR EACH ROW 
BEGIN 
	if NEW.uuid IS NULL OR NEW.uuid ='' THEN
	SET NEW.uuid =UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `invoice` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_invoice` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_invoice` BEFORE INSERT ON `invoice` FOR EACH ROW 
BEGIN
  IF NEW.uuid IS NULL OR NEW.uuid = '' THEN
    SET NEW.uuid = UUID();
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `invoiceproduct` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_productInvoice` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_productInvoice` BEFORE INSERT ON `invoiceproduct` FOR EACH ROW 
BEGIN 
IF NEW.uuid IS NULL OR NEW.uuid='' THEN
SET NEW.uuid=UUID();
END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `invoicestatus` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_invoiceStatus` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_invoiceStatus` BEFORE INSERT ON `invoicestatus` FOR EACH ROW 
BEGIN 
IF NEW.uuid IS NULL OR NEW.uuid= '' THEN
 SET NEW.uuid=UUID();
END IF;
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
