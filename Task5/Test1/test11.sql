BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT quantity FROM items WHERE id = 1;
SELECT pg_sleep(10);
SELECT quantity FROM items WHERE id = 1;
COMMIT;

--результат второго чтения будет уже с учётом изменений, в транзакции 2