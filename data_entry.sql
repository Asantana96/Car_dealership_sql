--table alterations 
ALTER TABLE customer
RENAME COLUMN sales_id TO sales_rep_id;

DELETE FROM sales_rep 
WHERE sales_rep_id  IN (3,4,5,6);

ALTER TABLE customer
ADD COLUMN age int;

ALTER table customer
RENAME COLUMN age TO _age;
ALTER TABLE customer 
ADD COLUMN address varchar;

ALTER TABLE car DISABLE TRIGGER ALL;

ALTER TABLE car 
ALTER COLUMN _year TYPE numeric;

--------Adding data 
INSERT INTO car (make,model,_year,color,used_or_new,repair_id,sales_rep_id)
VALUES('cadilac','cts',2008,'white','new',1,1);
INSERT INTO car (make,model,_year,color,used_or_new,repair_id,sales_rep_id)
VALUES('ford','mustang',2000,'blue','used',2,2);

INSERT INTO customer(invoice_id,sales_rep_id,first_name,last_name,_age,address)
VALUES (1,1,'robert','parker',23,'22 wine rd');
INSERT INTO customer(invoice_id,sales_rep_id,first_name,last_name,_age,address)
VALUES (1,1,'peter','johnson',28,'689 cirle ct');

INSERT INTO mechanics (service_ticket_id,first_name,last_name)
VALUES (1,'blake','lopez');
INSERT INTO mechanics (service_ticket_id,first_name,last_name)
VALUES (1,'april','kenndy');
--------creating a function to add sales rep information
CREATE OR REPLACE FUNCTION add_sales_rep (
	_first_name varchar,
	_last_name varchar
	)
RETURNS void AS 
$$
BEGIN 
	INSERT into sales_rep (first_name,last_name)
	VALUES (_first_name,_last_name);
END;
$$
LANGUAGE plpgsql;

SELECT add_sales_rep ('andy','santana');
SELECT add_sales_rep ('john','doe')

SELECT * FROM customer; 
-------------------


	
