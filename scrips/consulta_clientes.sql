USE STORE_DANI;

#INSERT INTO CUSTOMER(PERSON_ID) VALUES(5);

SELECT people.firstName, people.lastName, 
                    people.address, document_type.id AS docValue, document_type.type, 
                    people.documentNumber, people.phone, roles.id AS roleValue, roles.name, 
                    people.id AS valuePerson, people.createdAt, people.updatedAt 
                FROM people
                INNER JOIN document_type ON people.documentTypeId = document_type.id
                INNER JOIN roles ON roles.id = 3 -- Asumiendo que el rol 'cliente' es el rol 3
                INNER JOIN customer ON customer.personId = people.id;
                
SELECT *FROM CUSTOMER;