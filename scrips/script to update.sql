USE `store_dani`;

#ALTER TABLE `peopleRol` RENAME `userRoles`;

#SHOW CREATE TABLE `userroles`;

#ALTER TABLE `userRoles` DROP FOREIGN KEY `userroles_ibfk_1` ;

#ALTER TABLE `userRoles` ADD COLUMN `userId` int(20),
#ADD FOREIGN KEY(`userId`) REFERENCES `user`(`id`);

#ALTER TABLE `userRoles` DROP COLUMN `peopleId`;

#SHOW CREATE TABLE `productsupplier`;

#ALTER TABLE `productSupplier` DROP FOREIGN KEY `productsupplier_ibfk_2` ;
#ALTER TABLE `productsupplier` DROP COLUMN `peopleId`;
#ALTER TABLE `productsupplier` ADD COLUMN `userId` INT(20),
#ADD FOREIGN KEY(`userId`) REFERENCES `user`(`id`);

#SHOW CREATE TABLE INVOICE;
#ALTER TABLE `invoice` DROP FOREIGN KEY `invoice_ibfk_3` ;
#ALTER TABLE `invoice` DROP COLUMN `peopleId`;
#ALTER TABLE `invoice` ADD COLUMN `userId` int(20);
#ALTER TABLE `invoice` ADD FOREIGN KEY(`userId`) REFERENCES `user`(`id`);


