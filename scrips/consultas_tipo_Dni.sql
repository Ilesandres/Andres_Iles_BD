USE STORE_DANI;


#ALTER TABLE category ADD MODIFY `uuid` CHAR(36) NOT NULL;
#UPDATE category SET `uuid` = uuid() WHERE `uuid`=' ';
#ALTER TABLE category ADD UNIQUE (`uuid`);

#ALTER TABLE documentType ADD COLUMN `uuid` CHAR(36) not null;

#UPDATE documentType SET `uuid`=UUID() where `uuid` =' '; 
#ALTER TABLE documentTypE ADD UNIQUE(`uuid`);

#DELIMITER$$
#CREATE TRIGGER before_insert_typeDni
#BEFORE INSERT ON documentType
#FOR EACH ROW
#BEGIN 
#	if NEW.uuid IS NULL OR NEW.uuid ='' THEN
#	SET NEW.uuid =UUID();
#	END IF;
#END$$
#DELIMITER$$


SELECT *FROM documenttype;