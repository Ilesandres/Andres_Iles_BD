
#select todos los prodctos  todos los productos

SELECT p.name AS product_name, c.firstName AS category_name
FROM product AS p
CROSS JOIN people AS c;


SELECT people.firstName, I.name AS documenttype
FROM people 
CROSS JOIN category AS I;
