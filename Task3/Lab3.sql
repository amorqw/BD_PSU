CREATE TABLE if not exists spec(
    id int,
    name_table VARCHAR NOT NULL,
    name_column VARCHAR NOT NULL,
    max_value INT
);
INSERT INTO spec(id,name_table, name_column,max_value) VALUES
    (1,'spec', 'id',1);

CREATE OR REPLACE FUNCTION Hp(name_table1 VARCHAR, name_column1 VARCHAR)
    RETURNS INTEGER AS $Hp$
DECLARE
    next_id int;
    max_id int;
    id_id int;
BEGIN
SELECT max_value, id INTO max_id,id_id
FROM spec WHERE (name_table = name_table1) AND (name_column = name_column1);

if found then
        next_id := max_id + 1;
UPDATE spec
SET max_value = next_id
    where id=id_id;
ELSE
EXECUTE format('SELECT COALESCE(MAX(%I), 0) FROM %I', name_column1, name_table1) INTO max_id;
next_id := max_id + 1;
id_id= Hp('spec','id');

INSERT INTO spec (id,name_table, name_column, max_value)
VALUES (id_id,name_table1, name_column1, next_id);
END IF;

RETURN next_id;
END;
$Hp$ LANGUAGE plpgsql;

select Hp ('spec', 'id'); --2
select * from spec; --Должна быть 1 строка (1, spec, id, 2);.
select Hp ('spec', 'id');--3
select * from spec; --Должна быть 1 строка &quot;(1, spec, id, 3)&quot;.
create table if not exists test (id int);
insert into test(id) values(10);
select Hp('test','id');--11
select * from spec; --Должно быть 2 строки &quot;(1, spec, id, 4)&quot; &quot;(4, test,id, 11)&quot;.
select Hp('test','id');
select * from spec;
create table test2 (num_value1 int, num_value2 int);
select Hp('test2','num_value1');
select * from spec;
select Hp('test2','num_value1');
select * from spec;
insert into test2(num_value1, num_value2) values (2,13);
select Hp('test2','num_value2');
select * from spec;
SELECT Hp('test2', 'num_value1'); --3
SELECT Hp('test2', 'num_value1'); --4
SELECT Hp('test2', 'num_value1'); --5
SELECT Hp('test2', 'num_value1'); --6
SELECT Hp('test2', 'num_value1'); --7
select * from spec;
drop function Hp(varchar,varchar);
drop table if exists spec;
drop table if exists test;
drop table if exists test2;