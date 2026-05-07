-- 1. Database setup and Table creation
CREATE DATABASE IF NOT EXISTS prime;
USE prime;

CREATE TABLE accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    balance DECIMAL(10, 2)
);

-- 2. Fresh Data Insert
INSERT INTO accounts (name, balance) VALUES
('ADAM', 400.00),
('BOb', 300.00),
('Charlie', 1000.00);

-- check after insert data
SELECT * FROM accounts;

-- 3. Transaction Logic with Savepoint
START TRANSACTION;

UPDATE accounts SET balance = balance + 1000 WHERE id = 1;
SAVEPOINT after_wallet_topup;

UPDATE accounts SET balance = balance + 10 WHERE id = 1;

ROLLBACK TO after_wallet_topup;
COMMIT;

SELECT * FROM accounts;
