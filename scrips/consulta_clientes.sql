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





SELECT peoples.firstName, peoples.lastName,
peoples.address, documentTypes.id AS docValue, documentTypes.type,
peoples.documentNumber,peoples.phone, roles.id AS roleValue, roles.name,
peoples.id AS valuePerson, peoples.createdAt, peoples.updatedAt, peoples.isActive
 FROM peoples
INNER JOIN documentTypes ON peoples.documentTypeId=documentTypes.id
INNER JOIN `users` ON peoples.userId=`users`.id
INNER JOIN `userroles` ON `users`.id=`userroles`.userId
INNER JOIN roles ON  userroles.rolId=roles.id WHERE peoples.firstName="Juan" AND peoples.lastName="Perez" AND 
roles.name="vendedor"
;


EXPLAIN SELECT peoples.firstName, peoples.lastName,
peoples.address, documentTypes.id AS docValue, documentTypes.type,
peoples.documentNumber,peoples.phone, roles.id AS roleValue, roles.name,
peoples.id AS valuePerson, peoples.createdAt, peoples.updatedAt, peoples.isActive
FROM peoples
INNER JOIN documentTypes ON peoples.documentTypeId = documentTypes.id
INNER JOIN `users` ON peoples.userId = `users`.id
INNER JOIN `userroles` ON `users`.id = `userroles`.userId
INNER JOIN roles ON userroles.rolId = roles.id
WHERE roles.id = 1;




SELECT * FROM people
WHERE people.id=(SELECT user.peopleId FROM `user` WHERE user.id=1)



                
