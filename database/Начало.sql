-- DDL - CREATE, ALTER, DROP
-- DML - INSERT, UPDATE, DELETE, SELECT

-- CREATE - позволяет создавать сущности Базы Данных 
-- CREATE TABLE <название таблицы>
-- (
-- 		<имя атрибута> <тип данных атрибута> <правила/ограничения атрибута>,
--		...
-- 		PRIMARY KEY(<имя атрибута>)
-- )

DROP TABLE IF EXISTS public.example;

CREATE TABLE IF NOT EXISTS public.example
(
    id uuid,
    name text,
    age integer,

	PRIMARY KEY(id)
)

select * from example;
