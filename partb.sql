-- T1
BEGIN;
INSERT INTO Account VALUES (447712, 300.00, 106);
INSERT INTO Client VALUES (999433, 'Rasmussen', 'Igor', 'Single', 'V6A 0X8', 2505556969, 'Victoria');
INSERT INTO Owns VALUES (447712, 999433);
COMMIT;

-- T2
BEGIN;
SELECT dollar_balance INTO old_balance FROM Account WHERE account_number=447712;
UPDATE Account SET dollar_balance=(old_balance - 275.00) WHERE account_number=447712; 
COMMIT:

-- T3
BEGIN; 
SELECT dollar_balance into transfer_from FROM Account WHERE account_number = 424244;
SELECT dollar_balance into transfer_to FROM Account WHERE account_number = 447712;
UPDATE Account SET dollar_balance = transfer_to + 2800 WHERE account_number = 4477212;
UPDATE Account SET dollar_balance = transfer_from - 2800 WHERE account_number = 424244;
COMMIT;

-- T4
BEGIN;
SELECT dollar_balance into transfer_from FROM Account WHERE account_number = 445128;
SELECT dollar_balance into transfer_to FROM Account WHERE account_number = 447712;
UPDATE Account SET dollar_balance = transfer_from - 1000000 WHERE account_number = 445128;
UPDATE Account SET dollar_balance = transfer_to + 1000000 WHERE account_number = 4477212;
COMMIT;

-- T5
BEGIN; 
UPDATE Client SET marital_status = "Married", postal_code = "M3B 3R5‎", phone_number="4162345432",  
WHERE client_number = 999433;
UPDATE Account SET branch_number = 100;

-- T6
BEGIN;
SELECT branch_number INTO toronto_branch FROM Branch WHERE city='Toronto';
SELECT SUM(dollar_balance) FROM Account WHERE branch_number=toronto_branch;
COMMIT;

-- T7
COMMIT;
BEGIN;
SELECT avg(dollar_balance) as Average Balance FROM Account where branch_number = 107;
COMMIT;

-- T10
--Igor withdraws $550,000.00, in cash, from the newly opened joint account.
BEGIN;
UPDATE account SET dollar_balance = dollar_balance - 550000 WHERE account_number = 425450;
COMMIT;


