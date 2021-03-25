create database test_join;
use test_join;

create table table1(
id int, 
C1 varchar(1)
);

create table table2(
id int, 
C2 varchar(1)
);


insert into table1 values 
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E'), 
(6, 'F');

insert into table2 values 
(5, 'A'),
(6, 'B'),
(7, 'C'),
(8, 'D'),
(9, 'E'), 
(10, 'F');



/* cross join */
-- output all rows in table1 is joined to every rows in the table2 -- 
select * from table1 t1 join table2 t2;  
select * from table1 t1 inner join table2 t2; -- keyword inner is ignored in this case --

-- inner join --
-- output - only rows that have a match --
select * from table1 t1 join table2 t2 on t1.id = t2.id; 
select * from table1 t1 inner join table2 t2 on t1.id = t2.id;
select * from table1 t1 cross join table2 t2 on t1.id = t2.id; -- keyword cross is ignored in this case -- 

/* outer left and outer right join */
select * from table1 t1 left join table2 t2 on t1.id = t2.id; -- output - all rows that have a match  and all rows of the left table (table1) -- 
select * from table1 t1 right join table2 t2 on t1.id = t2.id; -- output - all rows that have a match  and all rows of the right table (table2)  -- 
