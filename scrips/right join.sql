SELECT 
product.name AS ProductName,
category.name AS CategoryName
FROM 
product
RIGHT JOIN 
productcategory ON product.id = productcategory.productId
RIGHT JOIN 
category ON productcategory.categoryId = category.id;



SELECT 
invoice.id AS InvoiceID,
people.firstName AS FirstName,
people.lastName AS LastName,
invoice.createdAt AS InvoiceDate
FROM 
invoice
RIGHT JOIN 
    people ON invoice.peopleId = people.id;

