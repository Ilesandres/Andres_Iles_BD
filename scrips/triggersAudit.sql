


##DROP TABLE auditLog;

CREATE TABLE auditLogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `user` VARCHAR(255),
    `action` VARCHAR(50),
    tableName VARCHAR(255),
    recordId INT,
    oldValue TEXT,
    newValue TEXT,
    actionTime DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE `invoiceAudit` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `invoiceId` INT(20) NOT NULL,
  `action` ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
  `oldTotal` DECIMAL(10,4) DEFAULT NULL,
  `newTotal` DECIMAL(10,4) DEFAULT NULL,
  `oldPaymentMethod` INT(20) DEFAULT NULL,
  `newPaymentMethod` INT(20) DEFAULT NULL,
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  `createdBy` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`invoiceId`) REFERENCES `invoices`(`id`)
);




DELIMITER //

CREATE TRIGGER afterUpdateInvoice
AFTER UPDATE ON invoices 
FOR EACH ROW
BEGIN
    IF CURRENT_USER() LIKE '%Localhost%' THEN
        INSERT INTO auditLogs (`user`,`action`, tableName, 
            recordId, oldValue, newValue,actionTime)
        VALUES (
            CURRENT_USER(), 'UPDATE', 'invoices', OLD.id, 
            CONCAT('Total: ', OLD.total, ', Payment Method: ', OLD.paymentMethod),
            CONCAT('Total: ', NEW.total, ', Payment Method: ', NEW.paymentMethod), 
            CURRENT_TIMESTAMP);
    END IF;
END //

DELIMITER ;


## insersion
DELIMITER //

CREATE TRIGGER afterInsertInvoice
AFTER INSERT ON invoices
FOR EACH ROW
BEGIN
    IF CURRENT_USER() LIKE '%Localhost%' THEN
        INSERT INTO auditLogs (`user`, `action`, tableName, 
            recordId, oldValue, newValue, actionTime)
        VALUES (
            CURRENT_USER(), 'INSERT', 'invoices', NEW.id, 
            NULL,
            CONCAT('Total: ', NEW.total, ', Payment Method: ', NEW.paymentMethod), 
            CURRENT_TIMESTAMP);
    END IF;
END //

DELIMITER ;







DELIMITER //

DROP TRIGGER IF EXISTS `before_insert_user` 

CREATE TRIGGER `before_insert_user` BEFORE INSERT ON `users` FOR EACH ROW 
BEGIN
	IF NEW.uuid IS NULL OR NEW.uuid='' THEN
		SET NEW.uuid=UUID();
	END IF;
END //


DELIMITER ;


