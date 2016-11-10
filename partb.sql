-- CSI3130  
-- Project Part B
-- Group 10B
-- 
-- Students
-- Joel Faubert #2560106
-- Youssef El-Khalili #7923376
-- Matthew Langlois #7731813

-- T1
BEGIN;
INSERT INTO Account VALUES (447712, 300.00, 106);
INSERT INTO Client VALUES (999433, 'Rasmussen', 'Igor', 'Single', 'V6A 0X8', 2505556969, 'Victoria');
INSERT INTO Owns VALUES (447712, 999433);
ROLLBACK;

-- T2
BEGIN;
UPDATE Account SET dollar_balance=(dollar_balance - 275.00) WHERE account_number=447712; 
ROLLBACK;

-- T3
BEGIN; 
UPDATE Account SET dollar_balance = dollar_balance + 2800 WHERE account_number = 4477212;
UPDATE Account SET dollar_balance = dollar_balance - 2800 WHERE account_number = 424244;
ROLLBACK;

-- T4
BEGIN;
UPDATE Account SET dollar_balance = dollar_balance - 1000000 WHERE account_number = 445128;
UPDATE Account SET dollar_balance = dollar_balance + 1000000 WHERE account_number = 4477212;
ROLLBACK;

-- T5
BEGIN; 
UPDATE Client SET marital_status='Married', postal_code='M3B 3R5‎', phone=4162345432 WHERE client_number = 999433;
UPDATE Account SET branch_number = 100 WHERE account_number = (SELECT account_number FROM Owns WHERE client_number = 999433);
ROLLBACK;

-- T6
BEGIN;
SELECT SUM(dollar_balance) FROM Account WHERE branch_number=
(SELECT branch_number FROM Branch WHERE city='Toronto' AND branch_name='Downtown');
ROLLBACK;

-- T7
BEGIN;
SELECT AVG(dollar_balance) AS Average_Balance FROM Account WHERE branch_number = 
(SELECT branch_number FROM Branch WHERE city='Calgary' AND branch_name='Downtown');
ROLLBACK;

-- T8
BEGIN;
UPDATE Account SET dollar_balance = dollar_balance*1.07 WHERE dollar_balance > 400000.00;
ROLLBACK;

-- T9
BEGIN;
INSERT INTO account(account_number, dollar_balance, branch_number) VALUES 
(425450, 600000.00, (SELECT branch_number FROM Branch WHERE city='Toronto' AND branch_name='Downtown'));
UPDATE account SET dollar_balance = dollar_balance - 600000 WHERE account_number = 445128;
ROLLBACK;

-- T10
--Igor withdraws $550,000.00, in cash, from the newly opened joint account.
BEGIN;
UPDATE account SET dollar_balance = dollar_balance - 550000 WHERE account_number = 425450;
ROLLBACK;