1. docker-compose up
2. Не знаю как правильно тут, но завершаю задачу Ctrl+c и запускаю вручную контейнер(чтобы был доступ к терминалу)
3. docker exec -it Kirill bash
4. pg_dump -U root -d Task1 -f /export.sql
5. exit
6. docker cp Kirill:/export.sql ./export.sql
7. docker exec -it Kirill psql -U root -d postgres
8. create database newdb;
9. \q
10. docker cp ./export.sql Kirill:/export.sql
11. docker exec -it Kirill psql -U root -d newdb -f /export.sql



