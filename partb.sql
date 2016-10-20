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


