USE STORE_DANI;

#DELETE FROM PRODUCT_CATEGORY WHERE PRODUCT_ID=9;
#DELETE FROM PRODUCT WHERE ID_PRODUCT=9;

#UPDATE PRODUCT SET IS_ACTIVE=TRUE, STOCK=34 WHERE ID=13;

ALTER TABLE  PRODUCT MODIFY COLUMN  PRICE FLOAT; 




SELECT  PRODUCT.id AS product_id,
PRODUCT.name AS PRODUCT_NAME,  PRODUCT.STOCK,  PRODUCT.PRICE, CATEGORY.name AS CATEGORY_NAME, 
PRODUCT.IS_ACTIVE FROM  category INNER JOIN  product_category ON category.id = product_category.category_id
 INNER JOIN   product ON product_category.product_id = product.id;

SELECT *FROM CATEGORY;


