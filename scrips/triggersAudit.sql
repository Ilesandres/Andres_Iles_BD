


##DROP TABLE auditLog;
/*
CREATE TABLE auditLogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `user` VARCHAR(255),
    `action` VARCHAR(50),
    tableName VARCHAR(255),
    recordId INT,
    oldValue TEXT,
    newValue TEXT,
    actionTime DATETIME
); */
CREATE TABLE productsAudit(
id INT(20) AUTO_INCREMENT PRIMARY KEY,
idChange INT(20),
`name` VARCHAR(255),
stock INT(10),
isActive BOOL
);




DELIMITER $$
CREATE TRIGGER `productchangelog`
AFTER UPDATE ON `products`
FOR EACH ROW
BEGIN
  INSERT INTO auditLogs (userId, ACTION, tableName, recordId, oldValue, newValue)
  VALUES (CURRENT_USER(), 'update', 'products', OLD.id, OLD.stock, NEW.stock);
END $$
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


