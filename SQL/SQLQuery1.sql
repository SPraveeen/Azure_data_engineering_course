-- how to create new database
CREATE DATABASE order_new;

-- how to use database
use order_new;

--how to delete database
drop database order_new;

--how to create table
create table emp(
id int,
name varchar(30),
address varchar(100),
salary int,
location varchar(30)
)


--create table and insert values in it
create table employee(
id int,
name varchar(28),
address varchar(28),
salary int,
bonus float
)

--insert values
insert into employee values(1,'praveen','india',10000,3.5)
insert into employee values(2,'sowmi','india',1000,4.5)

--how to read any tables
select * from employee;

--create table and insert only few column values in the table
insert into employee(id,name,bonus) values(3,'arun',4.5);

-- not null ansd unique constraints

--table - email can't be blank
--table - unique phone number
create table employee1(
id int,
email varchar(128) not null,
phone varchar(28) unique
);

insert into employee1 values(1,'abc@gmail.com',1234);
insert into employee1 (id,email,phone) values(2,'def@gmail.com',2345);
insert into employee1 values(3,'cda@gmail.com',1234);

select * from employee1;

-- 10.check and default constraints

-- 1. create table emp where age column should contain value only greater than 18
-- 2. create table emp where country value should automatic take default INDIA.

create table emp2(
id int,
age int check (age >18),
country varchar(28) default 'india'
)

insert into emp2 values(1,19,'india')
insert into emp2 (id,age) values(2,20)


select * from emp2;

-- 11. primary key vs unique key
-- a primary key is a column(or a set of columns) that uniquely identifies each row in a table.
-- no two rows can have the same primary key value, and it can't be null.

-- it doesn't contain duplicate valu
-- it cant be null
-- we can have 1 primary key in the table

-- difference between unnique key vs primary key
-- unique can contain null but not duplicate

create table emp3(
id int primary key,
email varchar(28)
)

insert into emp3 values(1,'abc@gmail.com')

-- primary key vs foreign key
create table department1(
dept_id int primary key,
dapt_name varchar(28)
)

create table student1(
id int primary key,
name varchar(28),
dept_id int,
foreign key(dept_id) references department1(dept_id)
)


--filtering and sorting
--13.how to filter data in sql
-- filter a data from employee table where salary greater than 70000
select * from emp where salary > 70000

-- filter a data from empl where location is null
select * from emp where location is null;

-- 14.how to sort the data in sql
-- sort the data based on highest to lowest salary
select * from emp order by salary desc;

-- sort the data based on lowest to highest salary
select * from emp order by salary asc;

--delete vs drop vs truncate in sql
-- delete ->to delete any specific row or column data from table
delete from emp where id=2;

--truncate ->to delete complete data from table but column name/structure will be there
truncate table emp;

--drop ->all data + table will be deleted
drop table emp;

select * from emp;

-- update in sql
-- update employee location as INDIA where location is null
UPDATE emp set location='india'
where location is null;

-- update salary as 100000 for shyam
update emp set salary=10000
where name='shyam';

-- update salary as 1000000 if its null
update emp set salary =10000
where salary is null;

-- and/or/not/in
-- and
-- give emp details who are from hr dept and aslo salry is 100000
select * from employee where dept='hr' and salary = 100000

-- give the employee details who are from hr department or from location usa
select * from employee where dept='hr' or location='usa'

--or/in
--give me emp details of employee wwhere ID is 2,3,4,6
select * from emp where id =2 or id=3 or id=4 or id=6;
select * from emp where id in(2,3,4,6);

-- not in
-- give emp details where id not in (2,3,4,5,6)
select * from employee where id not in (2,3,4,5,6);


-- aggregate in sql
-- how to find maximum salary of empl from emp1 table
select max(salary) from employee;

-- how to find minimum salary of emp 
select min(salary) from employee;

-- total salary of employee
select sum(salary) from employee;

-- find total no of employee
select count(id) from employee;

-- find avg salary of employee
select avg(salary) from employee


-- group by in sql
-- we use group by clause to group rows based on the value of cloumns.
-- find no of customers in each country
select count(customers),country from employee
group by country;

-- find no of emmp present in each  location
select count(id) as cnt,location from employee
group by location;

--find highest salary employee from each location
select max(salary) as max_salary, location from employee
group by location;

--find lowest salary employee from each location
select min(salary) as min_salary, location from employee
group by location;

-- find total salary from each location
select sum(salary), location from employee
group by location

-- like operator
-- to take record with specific words
-- search all records where description start-white
select * from employee where description like 'white%'

-- search all records where description end-holder
select * from employee where description like '%holder'

-- search all records where description is 'playhouse'
select * from employee where description like '%playhouse%'

-- query 26.
-- having clause in sql
-- the sql having clause is similar to where clause
-- are used to filter rows in a table based on specified criteria

-- having clause was added to sql because the where keyword cannot be used with aggregare functions

-- find the address of customers whose total salary is greater than 5000

select sum(salary),address 
from customers 
group by address 
having sum(salary) >5000;

-- find the address of customer where average salary greater than 5000
select avg(salary),address 
from customers 
group by address
having avg(salary) > 5000;

-- top/limit in sql

-- query 1:how to get only first 3 record from table

--sql server
select top 3 * from employee;

--mysql
select * from employee limit 3;

-- query 2:how to get 50% records from table
select top 50 percent * from employee;

-- query 3: write query to get top 2 highest salary of eployee
select top 2 * from employee order by salary desc;

-- query 4: write query to get bottom 2 salary of employee
select top 2 * from employee order by salary asc;

-- query 5: query to get top 2 records from india based on salary
select top 2 * from employee
where location='India'
order by salary desc;


-- unique records
-- keyword (Distinct)
select distinct(id),name from empl;


-- coalesce in sql
-- to handle null values in a table

-- replace null phone numbers with unknown
select name,coalesce(phone,'unknown') from employees;

-- interview ques
-- select the first available email (first non null values)
-- if primary email is null then take value from alternate email column
select name,coalesce(email,alternate_email) from employee;

select name,coalesce(email,alternate_email,'unknown') from employee;

-- calculate the total compensation (salary + bonus):
select salary + coalesce(bonus,0) from employees;


-- joining (interwiew que)

select * from employees
select * from departments

-- inner join

select * from employees 
inner join departments 
on employees.department_id = departments.department_id;

--left join

select * from employees 
left join departments 
on employees.department_id = departments.department_id;

--right join

select * from employees 
right join departments 
on employees.department_id = departments.department_id;

-- full join

select * from employees 
full join departments 
on employees.department_id = departments.department_id;

-- union vs union all

-- union : removes duplicate rows from the result set
-- union all: keeps all rows, including duplicates

-- schema should be same

select * from employee_2023

select * from employee_2024

--union
select * from employee_2023
union
select * from employee_2024

--union all
select * from employee_2023
union all
select * from employee_2024

-- if we do {it'll work}
select emp_id,name from employees_2023
union
select emp_id,name from employees_2024

-- if we do {it won't work}
select emp_id,name from employees_2023
union
select name,department_id from employees_2024

create database employees_2023;

create table employees_2023(
employee_id int,
name varchar(20),
department_id int
)

insert into employees_2023 values(1,'ashok',101)
insert into employees_2023 values(2,'bibi',102)
insert into employees_2023 values(3,'cowh',103)

select * from employees_2023;

--alter in sql
-- the alter statemnt is used to change the structure of a table after it has been created.
-- this helps when you need to update the schema without losing existing data.


-- add new column salary int in the existing table withouut dropping it
alter table employees_2023 add salary int;

-- change the schema of salary column from int to varchar
alter table employees_2023 alter column salary varchar(128);
alter table employees_2023 alter column salary int;

-- delete column salary from the existing table
alter table employees_2023 drop column salary

-- windows function
-- over clause and partition by

-- over
-- the over clause in SQL is used with window functions(like sum,count,row_number, etc.,)
-- to perform calculations across a specific set of rows related to the current row.

-- the over clause allows for partitioning and ordering rows.
-- without collapsing then into a single result like aggregate.

-- Types of windows functions
-- aggregate fn: sum(),min(),avg(),max(),count()
-- ranking fn:row_number(),rank(),dense_rank(),ntile()
-- value fn:lead(),lag(),first_value(),last_value()

create table sales(
sales_id int,
salesperson varchar(50),
region varchar(50),
amount decimal(10,2)
)

insert into sales (sales_id,salesperson,region,amount)
values(1,'alice','north',500),
(2,'bob','south',300),
(3,'alice','north',200),
(4,'charlie','south',700),
(5,'bob','south',400),
(6,'alice','north',800);

select * from sales;

-- find out the total amount based on each region
select sum(amount),region from sales
group by region;

select *,sum(amount) over(partition by region) from sales;

-- find out min amount based on each region
select *,min(amount) over(partition by region) from sales;

-- find out max amount based on each region
select *,max(amount) over(partition by region) from sales;

-- find out avg amount based on each region
select *,avg(amount) over(partition by region) from sales;

select *,min(amount) over(partition by region) as min_amt,
max(amount) over(partition by region) as max_amt,
avg(amount) over(partition by region) as avg_amt
from sales;

-- windows function
-- row number, rank,dense_rank

-- assign ranks or numbers to rows based on the order defined in the
-- orderby clause of the over() window function

create table employees1(
name varchar(100),
employee_id int,
department varchar(30),
salary int
)

insert into employees1 
(name,employee_id,department,salary) 
values('alice',1,'sales',5000),
('bob',2,'sales',3000),
('charlie',3,'sales',3000),
('eve',4,'sales',2000),
('dany',5,'sales',2000)

select * from employees1;

select *, ROW_NUMBER()over(order by salary desc) as row_no,
rank()over(order by salary desc) as rnk,
dense_rank()over(order by salary desc)as den_rnk from employees1;

-- lead and lag

-- lead() and lag() are window functions that allow you to access data
-- from the next row(lead()) or previous ros(lag()) in a result set

select *, lag(salary,1) over(order by employee_id)as prev_salary
from employees1;

select *, lead(salary,1) over(order by employee_id)as next_salary
from employees1;

select *,lag(salary,1) over(order by employee_id)as prev_salary,
lead(salary,1) over(order by employee_id)as next_salary from employees1;

-- CTE
-- a common table expression in sql is a temp result set that you can 
--reference within a select, insert, update or delete statement

-- cte's are oftern used to simplify complex queries,
-- make queries more readable and allow for recursive queries.

-- cte's are powerful for organizing sql code,
-- especially in muli-step analysis or whn calculating intermediate results.

--syntax
select * from employees1;

with cte as (
select * from employees1
)
select * from cte;

-- find the 3rd highest salary from empl table
select *,dense_rank() over(order by salary)as drk 
from employees1;

with cte1 as
(
select *,dense_rank() over(order by salary desc)as drk 
from employees1
)

select * from cte1 where drk=1;

-- find second lowest salry of emp


with cte1 as
(
select *,dense_rank() over(order by salary asc)as drk 
from employees1
)

select * from cte1 where drk=2;

-- view in sql
-- a view in sql is a virtual table created by a query.
-- views don't store date physically but instead store
-- a query that generates the data on demand.

select * from employees1

create view emp_infoo as
select name,department from employees1

select * from emp_infoo;

-- to delete view
drop view emp_info;

-- stored procedure
-- syntax

create procedure procedure_name
as
sql_statemt
go;

-- to call
exec procedure_name;

select * from employees1

-- stored procedure example
create procedure emp_sp as
select * from employees1
go;

exec emp_sp

-- stored procedure with one parameter
drop procedure emp_sp1

create procedure emp_sp1 @dept_id varchar(50) as
select * from employees1 where department=@dept_id;

exec emp_sp1 sales

--stored procedure with multiple parameters
select * from employees1;

create procedure emp_smp2 @department varchar(50), @salary int as
select * from employees1 where department=@department and salary=@salary;

exec emp_smp2 sales,5000;


-- subquery

-- a sql subquery, also known as a nesterd query or inner query,
-- a query within another sql statement

-- it allows you to use the result of one query as input in another query

-- 1. find employees who earn more than the avg salary across all empl
select avg(salary) from employees1;

select * from employees1 where salary > (select avg(salary) 
from employees1)

--2. list employees who work in deppartments located in 'chicago'
select departmet_id 
from departments where location = 'chicago'

select * from employee 
where department_id in 
(select departmet_id from departments 
where location = 'chicago')



---- triggers in sql

-- A trigger in SQL is a set of instructions that automatically execute in response to specific events on a particular table or view. Triggers are typically used to enforce business rules, maintain audit trails, and automate tasks such as calculations or updates when changes are made to a database.

--Trigger Types
--BEFORE Trigger: Executes before an operation (INSERT, UPDATE, or DELETE) is completed.
--AFTER Trigger: Executes after an operation is completed.
--INSTEAD OF Trigger: Typically used on views to handle what happens instead of a default INSERT, UPDATE, or DELETE action.


CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);


CREATE TABLE Backup_Employee (
    backup_id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    deleted_at DATETIME DEFAULT GETDATE()
);


CREATE TRIGGER employee_delete
ON Employee
AFTER DELETE
AS
BEGIN
    INSERT INTO Backup_Employee (employee_id, employee_name, department_id, salary, deleted_at)
    SELECT 
        employee_id, 
        employee_name, 
        department_id, 
        salary, 
        GETDATE() 
    FROM DELETED;
END;





--Testing the Trigger

INSERT INTO Employee(employee_id, employee_name, department_id, salary)
VALUES 
(1, 'Alice', 101, 5000),
(2, 'Bob', 102, 6000),
(3, 'Carol', 101, 5500);

select * from Employee
select * from Backup_Employee


DELETE FROM Employee WHERE employee_id = 3



SELECT * FROM Backup_Employee;

--- practice questions and answers

CREATE TABLE Employee2 (
    employee_id INT ,
    employee_name VARCHAR(50),
    department_id INT,
    position VARCHAR(50),
    salary DECIMAL(10, 2)
);


INSERT INTO Employee2 (employee_id, employee_name, department_id, position, salary)
VALUES 
(1, 'Alice Johnson', 101, 'Software Engineer', 70000),
(2, 'Bob Smith', 102, 'Data Scientist', 80000),
(3, 'Carol White', 103, 'Project Manager', 75000),
(4, 'David Brown', 104, 'Quality Assurance', 60000),
(5, 'Eva Green', 105, 'HR Specialist', 55000),
(6, 'Frank Martin', 101, 'Software Engineer', 70000),
(3, 'Carol White', 103, 'Project Manager', 75000),
(4, 'David Brown', 104, 'Quality Assurance', 60000)

select * from employee2

-- 1. remove duplicate values from empl table
select distinct * from Employee2;

-- 2. write a query to find out duplicate values from employee
with cte2 as(
    select *,row_number() over(partition by employee_id order by employee_id) as rn
from Employee2
)

select * from cte2 where rn =2;

-- 3. write a query to find out highest earning employee based 
-- on each position
select * from employee2;

with cte1 as(
select *, row_number() over(partition by position 
order by salary desc) as d_rnk from Employee2)
select * from cte1 where d_rnk = 1
order by employee_id;

select max(salary),position from Employee2
group by position;

-- 4. top 3 hihest earning employee
select  distinct top 3 * from Employee2 
order by salary desc

-- 5.query to get top 3 lowest earning employee
select  distinct top 3 * from Employee2 
order by salary asc;


CREATE TABLE Emp (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    location VARCHAR(50)
);

INSERT INTO Emp (employee_id, employee_name, department, salary, location)
VALUES 
(1, 'Alice Johnson', 'Engineering', 75000, 'New York'),
(2, 'Bob Smith', 'Data Science', 85000, 'San Francisco'),
(3, 'Carol White', 'Human Resources', 65000, 'Chicago'),
(4, 'David Brown', 'Engineering', 78000, 'Austin'),
(5, 'Eva Green', 'Marketing', 70000, 'Seattle'),
(6, 'Frank Martin', 'Data Science', 82000, 'New York'),
(7, 'Grace Lee', 'Finance', 90000, 'Los Angeles'),
(8, 'Harry Clark', 'Sales', 72000, 'Chicago'),
(9, 'Ivy Baker', 'Human Resources', 67000, 'Austin'),
(10, 'Jack Wilson', 'Marketing', 71000, 'San Francisco'),
(11, 'Karen Evans', 'Engineering', 76000, 'Seattle'),
(12, 'Leo Adams', 'Data Science', 84000, 'New York'),
(13, 'Mona Scott', 'Finance', 88000, 'Los Angeles'),
(14, 'Nate Perry', 'Sales', 74000, 'Chicago'),
(15, 'Olivia Cooper', 'Engineering', 78000, 'Austin');

select *from emp

--query 5 write a query to find out 2nd highest salary employee

with cte as(
select * , row_number() over(order by salary desc) rn from emp
)
select * from cte where rn=3

--query 6 write a query to get 2nd lowest earning employee 
with cte as(
select * , row_number() over(order by salary asc) rn from emp
)
select * from cte where rn=2

--query 7 write a query to get 2nd highest salary based on each department 

with cte as(
select * , row_number() over(partition by department order by salary desc) as rn from emp
)
select * from cte where rn=2

--query 8 write query to get 3rd lowest salary based on each location 
with cte as(
select * , row_number() over(partition by location order by salary asc) as rn from emp
)
select * from cte where rn=3
--query 9 write a query to get bottom 2 salary based on each location 

with cte as(
select * ,row_number() over(partition by location order by salary asc) as rn from emp
)
select * from cte where rn in (1,2)

--query 10 write a query to get top 2 salary based on each department 

with cte as(
select * ,row_number() over(partition by location order by salary desc) rn from emp
)
select * from cte where rn in (1,2)


-- write a query to create new table with 
-- same schema as employee table
select * from employee;

select * into table3 from employee where 1=2;

select * from table3;

-- create new table like employee table(data + schema)
select * into table4 from employee where 1=1;

select * from table4;

-- query where employee_name starts with letter A
select * from employee where name like 'a%';

-- query where dept id starts with same letter and 
-- ends with same letter
select * from employee 
where left(department_id,1)=right(department_id,1);

-- query to get records in xml format
select * from employee for xml auto;

-- get current date
select getdate();
select CURRENT_TIMESTAMP

-- get current month
select month(getdate());

-- get current year
select year(getdate())


-- question 1. difference between union and union alll
UNION: Combines the results of two queries and removes duplicate rows
UNION ALL: Combines the results of two queries without removing duplicate.

-- question 2. primary key vs union differnece
primary key - used to serve as a unique identifier for each row in a table
cannot accept NULL values
only one primary key

UNIQUE KEY- Uniquely determines a row tht isn't' the primary key
can accept NULL values
More than one unique key

--rank vs dense rank
rank(): skips ranks if there are ties
dense_rank(): does not skips, even if there are ties

rank    dense_rank()    salary
1       1               100000
2       2               70000
2       2               70000
4       3               50000

-- delete vs drop vs truncate
    - DELETE: This command is used to remove specific rows from a table based on a condition. It can be rolled back if within a transaction.
    - TRUNCATE: This command removes all rows from a table, but it does not log individual row deletions. It is faster than DELETE for large tables and cannot be rolled back in most databases.
    - DROP: This command removes the entire table structure along with all its data from the database. It cannot be rolled back.


-- different windows functions
windows fns perfom calculations across a set of table rows related to the current row.

example include:
row_number()
rank()
dense_rank()
avg() over()

-- where and having clause difference.
where : filters rows before grouping (group by)
having: filters groups created by group by

-- how to handle null values in sql
use functions like
is null or is not null to filter records.
coalesce(column, default_value) to replace NULL with a default value



---important employee manager related sql question 

CREATE TABLE Emp4 (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    ManagerID INT,
    Department VARCHAR(50)
);

INSERT INTO Emp4 (EmpID, EmpName, ManagerID, Department)
VALUES 
    (1, 'John', NULL, 'HR'),        -- John is the top-level manager
    (2, 'Alice', 1, 'Finance'),    -- Alice reports to John
    (3, 'Bob', 1, 'IT'),           -- Bob reports to John
    (4, 'Charlie', 2, 'Finance'),  -- Charlie reports to Alice
    (5, 'Eve', 3, 'IT');         

select * from emp4
-- Find out the employees manager details from employee table
select a.EmpName,b.EmpName as Manager_name from emp4 a 
left join emp4 b on a.ManagerID=b.EmpID;

-- find cumulative sum of salary

select * from employee;

select *,sum(salary) over(order by id) as rn from employee;    

-- fill null values with previous values
create table choclate_brands(
chocolate_name varchar(50),
brand_name varchar(50)
);

insert into choclate_brands(chocolate_name,brand_name) 
values('kitkat','Nestle'),
('perk',NULL),
('Diary Milk','Cadbury'),
('5 Star',NULL),
('silk',NULL);

select * from choclate_brands;

with cte as
(
select *, row_number() over(order by (select NULL))as rn,
case
when brand_name is null then 0 else 1
end as rn1
from choclate_brands
), 
cte1 as
(
select *, sum(rn1) over(order by rn) as roll_sum from cte
)
select chocolate_name,brand_name,
max(brand_name) over(partition by roll_sum) as new_brand_name
from cte1

-- find new and repeated customer on each date.
with first_visit_date as (
select customer_id , min(order_date) first_order from customer_orders
group by customer_id
),
final as(
select a.* , b.first_order ,case when order_date=first_order then 1 else 0 end new_customer,
case when order_date!=first_order then 1 else 0 end repeated_customer
from customer_orders a join first_visit_date b 
on a.customer_id=b.customer_id 
)
select sum(new_customer) new , sum(repeated_customer) as repeated , order_date from final
group by order_date

select * from first_visit_date