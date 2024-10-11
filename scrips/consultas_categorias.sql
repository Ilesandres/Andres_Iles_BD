USE STORE_DANI;

#DELETE FROM PRODUCT_CATEGORY WHERE PRODUCT_ID=9;
#DELETE FROM PRODUCT WHERE ID_PRODUCT=9;

#UPDATE PRODUCT SET IS_ACTIVE=TRUE, STOCK=34 WHERE ID=13;

#ALTER TABLE  PRODUCT MODIFY COLUMN  PRICE FLOAT; 


#ALTER TABLE category ADD MODIFY `uuid` CHAR(36) NOT NULL;
#UPDATE category SET `uuid` = uuid() WHERE `uuid`=' ';
#ALTER TABLE category ADD UNIQUE (`uuid`);

DELIMITER $$
CREATE TRIGGER before_insert_category
BEFORE INSERT ON category
FOR EACH ROW
BEGIN
	IF NEW.uuid IS NULL OR NEW.uuid ='' THEN 
		SET NEW.uuid=UUID();
	END IF;
END$$
DELIMITER;









SELECT   product.id AS productId,product.name AS productName, 
                category.`name` AS categoryName, product.isActive,
                category.id AS valueCategory FROM category
            INNER JOIN  productCategory ON cat`category`egory.id = productCategory.categoryId
            INNER JOIN  product ON productCategory.productId = product.id;

SELECT *FROM category;



