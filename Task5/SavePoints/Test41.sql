BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT quantity FROM items WHERE id = 1;
SAVEPOINT before_update;
SELECT pg_sleep(10);
SELECT quantity FROM items WHERE id = 1;
--увидели изменения и откатываемся
-- при апдейте лучше обрабатывать ошибку на стороне и откатывать текущую транзакцию
ROLLBACK TO SAVEPOINT before_update;

COMMIT;
