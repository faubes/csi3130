CREATE TABLE Client (
	client_number SERIAL PRIMARY KEY,
	lastname VARCHAR(30),
	firstname VARCHAR(30),
	marital_status VARCHAR(10),
	postal_code VARCHAR(8),
	phone VARCHAR(10),
	city VARCHAR(20)
);

CREATE TABLE Account (
	account_number SERIAL PRIMARY KEY,
	dollar_balance NUMERIC(15,2),
	branch_number INT
);

CREATE TABLE Branch (
	branch_number SERIAL PRIMARY KEY,
	branch_name VARCHAR(30),
	city VARCHAR(30)
);

CREATE TABLE Owns (
	account_number INT REFERENCES Account(account_number),
	client_number INT REFERENCES Client(client_number),
	PRIMARY KEY (client_number, account_number)
);