BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT quantity FROM items WHERE id = 1;
SELECT pg_sleep(10);
SELECT quantity FROM items WHERE id = 1;
COMMIT;
--Транзакция 1 не увидит изменения, сделанные Транзакцией 2
-- Значение останется таким же