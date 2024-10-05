DROP DATABASE `store_dani`;
CREATE DATABASE IF NOT EXISTS `store_dani` ;
USE `store_dani`;

-- Tabla: tipo de documento
CREATE TABLE `document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Tabla: rol
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Tabla: persona
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `documentTypeId` int(11) DEFAULT NULL,
  `documentNumber` varchar(12) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`documentTypeId`) REFERENCES `document_type` (`id`)
);



-- Tabla: categoria
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Tabla: producto
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
);

-- Tabla: producto categoria
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
);

-- Tabla: proveedor rol y aumentar el valor Nit a tipo Id
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `taxNumber` varchar(12) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Tabla: producto proveedor
CREATE TABLE `product_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`)
);

-- Tabla: estado de factura
CREATE TABLE `invoice_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS invoice(
id INT AUTO_INCREMENT PRIMARY KEY,
peopleId INT,
statusId INT,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME,
FOREIGN KEY (peopleId) REFERENCES people(id),
FOREIGN KEY (statusId) REFERENCES invoice_status (id)
);

-- Tabla: factura producto
CREATE TABLE `invoice_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `invoiceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`)
);

-- Tabla: estado de orden
CREATE TABLE `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Tabla: orden
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceId` int(11) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  `details` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`),
  FOREIGN KEY (`statusId`) REFERENCES `order_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla: vendedor, convertir en rol 
CREATE TABLE `seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(40) DEFAULT NULL,
  `lastName` varchar(35) DEFAULT NULL,
  `documentTypeId` int(11) DEFAULT NULL,
  `documentNumber` varchar(12) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`documentTypeId`) REFERENCES `document_type` (`id`),
  FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`)
);

CREATE TABLE `userRol`(
id INT(20) AUTO_INCREMENT PRIMARY KEY,
peopleId INT(20),
rolId INT(20),
FOREIGN KEY(peopleId) REFERENCES people(id),
FOREIGN KEY(rolId) REFERENCES roles(id)
);

CREATE TABLE `productDesc`(
id int(20) AUTO_INCREMENT PRIMARY KEY,
productId int(20),
discount BOOLEAN,
FOREIGN KEY(productId) REFERENCES product(id)
);
