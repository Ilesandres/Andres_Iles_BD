

SELECT 
p.id AS product_id, 
p.name AS product_name, 
c.name AS category_name
FROM product p
LEFT JOIN productcategory pc ON p.id = pc.productId
LEFT JOIN category c ON pc.categoryId = c.id;


SELECT i.id AS invoice_id, i.createdAt, is.name AS status_name
FROM invoice AS i
LEFT JOIN invoicestatus AS `is` ON i.statusId = is.id;



SELECT p.id AS people_id, p.firstName, 
p.lastName, u.id AS user_id,  u.username
FROM  people AS p
LEFT JOIN `user` AS u ON p.id = u.peopleId;




