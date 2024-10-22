
USE store_dani;


##consulta general
SELECT  
                product.id AS productId,
                product.name AS productName, 
                product.stock, 
                product.price,
                category.name , 
                category.id,
                product.isActive
            FROM 
                category
            INNER JOIN 
                productCategory ON category.id = productCategory.categoryId
            INNER JOIN 
                product ON productCategory.productId = product.id
                
            INNER JOIN 
		productsstore ON product.id=productsstore.productId
	  WHERE productsstore.storeId=1 AND  productsstore.productId IS NOT NULL;
	  
##caso de uso del in
	  
SELECT `name`
FROM product
WHERE id IN (1, 2, 3,4);

SELECT product.`name`
FROM product
INNER JOIN productcategory ON productcategory.productId=product.id
INNER JOIN category ON productcategory.categoryId=category.id
WHERE category.id IN (SELECT id FROM category WHERE category.`name` = 'abarrotes');


SELECT  *FROM product AS p
INNER JOIN productcategory ON productcategory.productId=p.id
INNER JOIN category ON productcategory.categoryId=category.id;

SELECT c.`name`
FROM category AS c
WHERE EXISTS (SELECT 1 FROM product AS p
INNER JOIN productcategory ON productcategory.productId=p.id
INNER JOIN category ON productcategory.categoryId=category.id
 WHERE productcategory.categoryId = c.id);




SELECT price, product.`name` FROM product 
INNER JOIN productcategory ON productcategory.productId=product.id
INNER JOIN category ON productcategory.categoryId=category.id
WHERE category.id=10;

SELECT *FROM product;


SELECT product.name 
FROM product
WHERE product.price > ANY (SELECT price FROM product 
INNER JOIN productcategory ON productcategory.productId=product.id
INNER JOIN category ON productcategory.categoryId=category.id
WHERE category.id = 10);

SELECT AVG(price),product.`name` FROM product 
INNER JOIN productcategory ON productcategory.productId=product.id
INNER JOIN category ON productcategory.categoryId=category.id
WHERE category.id = 11;

SELECT product.name 
FROM product
WHERE product.price > (SELECT AVG(price) FROM product 
INNER JOIN productcategory ON productcategory.productId=product.id
INNER JOIN category ON productcategory.categoryId=category.id
WHERE category.id = 11);



SELECT 
    product.name, 
    product.price, 
    (SELECT AVG(p2.price) 
     FROM product p2
     INNER JOIN productcategory pc2 ON pc2.productId = p2.id
     INNER JOIN category c2 ON pc2.categoryId = c2.id
     WHERE c2.id = category.id) AS average_price_for_category
FROM product 
INNER JOIN productcategory ON productcategory.productId = product.id
INNER JOIN category ON productcategory.categoryId = category.id;








	  
	  
	  
	  
	  
	  