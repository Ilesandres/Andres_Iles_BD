USE STORE_DANI;

#DELETE FROM PRODUCT_CATEGORY WHERE PRODUCT_ID=9;
#DELETE FROM PRODUCT WHERE ID_PRODUCT=9;

#UPDATE PRODUCT SET IS_ACTIVE=TRUE, STOCK=34 WHERE ID=13;

#ALTER TABLE  PRODUCT MODIFY COLUMN  PRICE FLOAT; 




SELECT  
                product.id AS productId,
                product.name AS productName, 
                product.stock, 
                product.price,
                category.name AS categoryName, 
                product.isActive,
                category.id AS valueCategory
            FROM 
                category
            INNER JOIN 
                product_category ON category.id = product_category.categoryId
            INNER JOIN 
                product ON product_category.productId = product.id;

SELECT *FROM category;



