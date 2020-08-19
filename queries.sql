Query to Create the databases and the tables


CREATE database IF NOT EXISTS ENOTE3;

USE ENOTE3;

CREATE TABLE IF NOT EXISTS BI_assignment_person(
	id_person INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255),
	surname VARCHAR(255),
	zip INT,
	city VARCHAR(255),
	country VARCHAR(255),
	email VARCHAR(255),
	phone_number INT,
	birth_date DATE
	);


CREATE TABLE IF NOT EXISTS BI_assignment_account(
	id_account INT AUTO_INCREMENT PRIMARY KEY,
	id_person INT FOREIGN KEY,
	FOREIGN KEY (id_person) REFERENCES BI_assignment_person(id_person),
	account_type VARCHAR(50)
	);


CREATE TABLE IF NOT EXISTS BI_assignment_transaction (
    id_transaction INT PRIMARY KEY,
    FOREIGN KEY (id_account)
        REFERENCES BI_assignment_account (id_account),
    transaction_type VARCHAR(10),
    transaction_date DATE,
    transaction_amount FLOAT
);


















#Query to populate the  BI_assignment_person


CREATE database IF NOT EXISTS enote08;

USE enote08;

CREATE TABLE IF NOT EXISTS BI_assignment_person (
    id_person INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    zip INT,
    city VARCHAR(255),
    country VARCHAR(255),
    email VARCHAR(255),
    phone_number INT,
    birth_date DATE
);
    
LOAD DATA LOCAL INFILE '/home/augustine/Desktop/enote/BI_assignment_person.csv'
INTO TABLE BI_assignment_person
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY ' '
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET phone_number = NULLIF(phone_number,' ')
SET birth_date = STR_TO_DATE(birth_date,'%m/%d/%y');



Comments:
This failed indicating issues when trying to import the phone_number and birth_date fields. This is the main table from which the other tables depend.
