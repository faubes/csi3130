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
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;


INSERT INTO Account VALUES (447712, 300.00, 106);
INSERT INTO Client VALUES (999433, 'Rasmussen', 'Igor', 'Single', 'V6A 0X8', 2505556969, 'Victoria');
INSERT INTO Owns VALUES (447712, 999433);


-- T2
UPDATE Account SET dollar_balance=(dollar_balance - 275.00) WHERE account_number=447712;


-- T4
UPDATE Account SET dollar_balance = dollar_balance - 1000000 WHERE account_number = 445128;
UPDATE Account SET dollar_balance = dollar_balance + 1000000 WHERE account_number = 4477212;


-- T7
SELECT AVG(dollar_balance) AS Average_Balance FROM Account WHERE branch_number =
(SELECT branch_number FROM Branch WHERE city='Calgary' AND branch_name='Downtown');

-- T10
UPDATE account SET dollar_balance = dollar_balance - 550000 WHERE account_number = 425450;

ROLLBACK;