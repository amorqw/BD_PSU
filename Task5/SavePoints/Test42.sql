BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE items SET quantity = quantity - 10 WHERE id = 1;
COMMIT;
