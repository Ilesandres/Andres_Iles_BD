USE STORE_DANI;
#ALTER TABLE PRODUCT MODIFY COLUMN CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


#SELECT *FROM PRODUCT_CATEGORY;

#DELETE FROM PRODUCT_CATEGORY WHERE PRODUCT_ID=40;
#DELETE FROM PRODUCT_CATEGORY WHERE PRODUCT_ID=41;
#DELETE FROM PRODUCT_CATEGORY WHERE PRODUCT_ID=42;

#DELETE FROM PRODUCT WHERE ID=40;#42
#DELETE FROM PRODUCT WHERE ID=41;
#DELETE FROM PRODUCT WHERE ID=42;

SELECT  
    product.id AS productId,
    product.name AS productName, 
    product.stock, 
    product.price,
    GROUP_CONCAT(category.name ORDER BY category.name ASC SEPARATOR ', ') AS categoryNames, 
    GROUP_CONCAT(category.id  ORDER BY category.name ASC SEPARATOR ', ') AS valueCategories,
    product.isActive
FROM 
    category
INNER JOIN 
    productCategory ON category.id = productCategory.categoryId
INNER JOIN 
    product ON productCategory.productId = product.id
GROUP BY 
    product.id;
    
    

    
    

