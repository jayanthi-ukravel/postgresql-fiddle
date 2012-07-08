CREATE temporary TABLE IF NOT EXISTS schema (
    db_id            integer,
    name text,
    comment text
);
INSERT INTO schema(db_id,name) values(1,'pg_catalog'),(1,'information_schema'),(1,'public'),(1,'new');

INSERT INTO schema(db_id,name) values(2,'pg_catalog'),(2,'information_schema'),(2,'public');

select *
FROM (select * from schema where db_id=1) as original
JOIN (select * from schema where db_id=2) as new on new.name=original.name
/* 
 db_id |        name        | comment | db_id |        name        | comment 
-------+--------------------+---------+-------+--------------------+---------
     1 | pg_catalog         |         |     2 | pg_catalog         | 
     1 | information_schema |         |     2 | information_schema | 
     1 | public             |         |     2 | public             | 
(3 rows) 
*/