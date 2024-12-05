DELIMITER //

CREATE PROCEDURE getCategoryFromId(IN categoryId INT)
BEGIN
    SELECT * FROM categories WHERE id = categoryId;
END //

DELIMITER ;

CALL getCategoryFromId(13);




DELIMITER //

CREATE PROCEDURE getProductsWithCategory(IN categoryId INT)
BEGIN
    SELECT p.*
    FROM products p
    INNER JOIN productcategories pc ON p.id = pc.productId
    WHERE pc.categoryId = categoryId;
END //

DELIMITER ;



CALL getProductsWithCategory(11);



DELIMITER //

CREATE PROCEDURE insertProduct(
    IN productName VARCHAR(50),
    IN productStock INT,
    IN productPrice FLOAT,
    IN categoryIds INT
)
BEGIN
    INSERT INTO products (NAME, stock, price)
    VALUES (productName, productStock, productPrice);

    SET @productId = LAST_INSERT_ID();

    INSERT INTO productcategories (categoryId, productId)
    VALUES (categoryId, @productId);
END //

DELIMITER ;


CALL insertProduct(
'Agua bolsa',24,500.0,11
);






