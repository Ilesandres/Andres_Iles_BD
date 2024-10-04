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




#INSERT INTO CUSTOMER(PERSON_ID) VALUES(5);

SELECT people.firstName, people.lastName, 
                    people.address, document_type.id AS docValue, document_type.type, 
                    people.documentNumber, people.phone, roles.id AS roleValue, roles.name, 
                    people.id AS valuePerson, people.createdAt, people.updatedAt, people.isActive
                FROM people
                INNER JOIN document_type ON people.documentTypeId = document_type.id
                INNER JOIN roles ON roles.id = people.idRol
                WHERE people.idRol=1 AND  people.firstName like '%%' ORDER BY people.updatedAt DESC;
                
