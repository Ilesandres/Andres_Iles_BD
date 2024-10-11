 USE store_dani;
 
 #ALTER TABLE invoice ADD COLUMN `uuid` CHAR(36) NOT NULL;
 #UPDATE invoice SET `uuid` =UUID() WHERE `uuid`=' ';
 #ALTER TABLE invoice ADD UNIQUE(`uuid`);`invoice`
#DELIMITER $$

#CREATE TRIGGER before_insert_invoice
#BEFORE INSERT ON invoice
#FOR EACH ROW
#BEGIN
# IF NEW.uuid IS NULL OR NEW.uuid = '' THEN
#    SET NEW.uuid = UUID();
#  END IF;
#END$$

#DELIMITER ;

SELECT *FROM invoice;

##INVOICE PRODUCTOS

#ALTER TABLE invoiceProduct ADD COLUMN cant INT(10);
#ALTER TABLE invoiceproduct ADD COLUMN `uuid` CHAR(36);
#ALTER TABLE invoiceproduct ADD UNIQUE(`uuid`);

#DELIMITER$$
#CREATE TRIGGER before_insert_productInvoice
#BEFORE INSERT ON invoiceProduct
#FOR EACH ROW
#BEGIN 
#IF NEW.uuid IS NULL OR NEW.uuid='' THEN
#SET NEW.uuid=UUID();
#END IF;
#END$$
#DELIMITER

SELECT *FROM invoiceproduct;


##invoice status

#ALTER TABLE invoicestatus ADD COLUMN `uuid` CHAR(36);
#UPDATE invoicestatus set `uuid` =UUID() WHERE `uuid`='';
#ALTER TABLE invoicestatus ADD UNIQUE(`uuid`);

#DELIMITER$$
#CREATE TRIGGER before_insert_invoiceStatus
#BEFORE INSERT ON invoicestatus
#FOR EACH ROW
#BEGIN 
#IF NEW.uuid IS NULL OR NEW.uuid= '' THEN
# SET NEW.uuid=UUID();
#END IF;
#END$$

DELIMITER;




