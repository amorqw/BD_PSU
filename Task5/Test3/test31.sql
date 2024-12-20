BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT quantity FROM items WHERE id = 1;
SELECT pg_sleep(10);
UPDATE items SET quantity = quantity - 5 WHERE id = 1;
COMMIT;
--Транзакция завершится с ошибкой, если транзакция 2 вмешается