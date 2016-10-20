CREATE SCHEMA Banking AUTHORIZATION joel;
SET SCHEMA 'banking';

--CREATE DOMAIN marital_status_domain ();
--CREATE DOMAIN postal_code_ca_domain ();

CREATE TABLE Client (
client_number int,
lastname varchar(30),
firstname varchar(30),
marital_status varchar(10),
postal_code varchar(8),
phone varchar(10),
city varchar(20)
);

CREATE TABLE Account (
account_number int,
dollar_balance numeric(15,2),
branch_number int
);

CREATE TABLE Owns (
account_number int,
client_number int
);

CREATE TABLE Branch (
branch_number int,
branch_name varchar(30),
city varchar(30)
);

ALTER TABLE Client ADD PRIMARY KEY (client_number);
ALTER TABLE Account ADD PRIMARY KEY (account_number);
ALTER TABLE Owns ADD PRIMARY KEY (client_number, account_number);
ALTER TABLE Branch ADD PRIMARY KEY (branch_number);

ALTER TABLE Owns ADD CONSTRAINT accountfk FOREIGN KEY (account_number) REFERENCES Account (account_number) MATCH FULL;
ALTER TABLE Owns ADD CONSTRAINT clientfk FOREIGN KEY (client_number) REFERENCES Client (client_number) MATCH FULL;
ALTER TABLE Account ADD CONSTRAINT branchfk FOREIGN KEY (branch_number) REFERENCES Branch (branch_number) MATCH FULL;
