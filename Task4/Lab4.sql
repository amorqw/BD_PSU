CREATE TABLE if not exists spec(
    id int,
    name_table VARCHAR NOT NULL,
    name_column VARCHAR NOT NULL,
    max_value INT
);

INSERT INTO spec(id,name_table, name_column,max_value) VALUES
    (1,'spec', 'id',1);

CREATE OR REPLACE FUNCTION update_max_value()
RETURNS TRIGGER AS $$
DECLARE
    v_max INT;
BEGIN
    EXECUTE format('SELECT COALESCE(MAX(%I), 0) FROM %I', TG_ARGV[1], TG_ARGV[0]) INTO v_max;

    IF v_max > (SELECT max_value FROM spec
                WHERE name_table = TG_ARGV[0] AND name_column = TG_ARGV[1]) THEN
        UPDATE spec
        SET max_value = v_max + 1
        WHERE name_table = TG_ARGV[0] AND name_column = TG_ARGV[1];
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


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

        EXECUTE format('
            CREATE TRIGGER trigger_update_max_%I_%I_%s
            AFTER INSERT OR UPDATE OF %I ON %I
            FOR EACH ROW EXECUTE FUNCTION update_max_value(%L, %L)',
            name_table1, name_column1, id_id::text, name_column1, name_table1, name_table1, name_column1);
    END IF;

    RETURN next_id;
END;
$Hp$ LANGUAGE plpgsql;

CREATE TABLE IF NOT EXISTS test1 (id INT);
SELECT Hp('test1', 'id');
SELECT Hp('test1', 'id');
select * from spec;
INSERT INTO test1 (id) VALUES (10);
select * from spec;
UPDATE test1 SET id = 15 WHERE id = 10;
select * from spec;
CREATE TABLE IF NOT EXISTS test2 (id INT);

SELECT Hp('test2', 'id');

select * from spec;

INSERT INTO test2 (id) VALUES (50);
select * from spec;

DROP TABLE IF EXISTS test1, test2;
DROP FUNCTION IF EXISTS Hp(VARCHAR, VARCHAR);
DROP FUNCTION IF EXISTS update_max_value();
DROP TABLE IF EXISTS spec;