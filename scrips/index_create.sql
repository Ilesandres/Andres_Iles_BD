
CREATE INDEX  idx_lasttName ON peoples (lastName);

CREATE INDEX idx_peoples_firstName_lastName ON peoples (firstName, lastName);

CREATE INDEX idx_roles_name ON roles(`name`);


SHOW INDEX FROM peoples;



	
