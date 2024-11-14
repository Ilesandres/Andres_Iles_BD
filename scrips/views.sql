USE store_dani;

CREATE VIEW categoriesview AS 
SELECT categories.* FROM categories WHERE categories.id IS NOT NULL;


SELECT *FROM categoriesview;

CREATE VIEW productsWithCategories AS
SELECT p.id AS product_id, p.name AS product_name, c.name AS category_name
FROM  products p
INNER JOIN productcategories pc ON p.id = pc.productId
INNER JOIN categories c ON pc.categoryId = c.id;
   

SELECT *FROM productsWithCategories;

CREATE VIEW userAndRol AS
SELECT p.firstName, p.lastName,r.name FROM peoples AS p
INNER JOIN users AS u ON p.userId=u.id
INNER JOIN userroles AS ur ON u.id=ur.userId
INNER JOIN roles AS r ON ur.rolId=r.id;

SELECT *FROM userAndRol;
#DROP VIEW userAndRol;



SELECT TABLE_NAME 
FROM information_schema.views
WHERE table_schema='store_dani';

SHOW COLUMNS store_dani;