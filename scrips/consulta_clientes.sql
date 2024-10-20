USE STORE_DANI;

##ALTER TABLE customer ADD COLUMN idRol int default 1,
##ADD FOREIGN KEY (idRol) REFERENCES roles(id);

#ALTER TABLE invoice ADD COLUMN peopleId int,
#ADD FOREIGN KEY(peopleId) REFERENCES people(id);

#SHOW CREATE TABLE invoice;
#ALTER TABLE invoice DROP COLUMN customerId;
#DROP TABLE CUSTOMER;

SHOW CREATE TABLE seller;
#ALTER TABLE seller DROP FOREIGN KEY seller_ibfk_1;
#ALTER TABLE seller DROP COLUMN documentTypeId;
#ALTER TABLE seller DROP FOREIGN KEY seller_ibfk_2;
#ALTER TABLE seller DROP COLUMN roleId;
#ALTER TABLE invoice DROP FOREIGN KEY invoice_ibfk_1;
#ALTER TABLE seller ADD COLUMN peopleId INT,
#ADD FOREIGN KEY(peopleId) REFERENCES people(id);





SELECT people.firstName, people.lastName,
people.address, documentType.id AS docValue, documentType.type,
people.documentNumber,people.phone, roles.id AS roleValue, roles.name,
people.id AS valuePerson, people.createdAt, people.updatedAt, people.isActive
 FROM people
INNER JOIN documentType ON people.documentTypeId=documentType.id
INNER JOIN `user` ON people.id=`user`.peopleId
INNER JOIN `userroles` ON `user`.id=`userroles`.userId
INNER JOIN roles ON  userroles.rolId=roles.id WHERE roles.id=1
;

SELECT * FROM people
WHERE people.id=(SELECT user.peopleId FROM `user` WHERE user.id=1)



                
