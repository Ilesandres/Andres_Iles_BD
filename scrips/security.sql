CREATE USER 'Andres Iles'@'localhost' IDENTIFIED BY '123456789';

CREATE ROLE 'Lector';

CREATE ROLE 'Admin';

GRANT 'Admin' TO 'Andres Iles'@'localhost';

