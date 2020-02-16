-- Drop table code if needed: 
--DROP TABLE departments;
--DROP TABLE dept_emp;
--DROP TABLE dept_manager;
--DROP TABLE employees;
--DROP TABLE salaries;
--DROP TABLE titles;

-- Create tables for csv data: 
create table departments(
	dept_no varchar(20) PRIMARY KEY not null,
	dept_name varchar(20)
);

create table dept_emp(
	emp_no int,
	dept_no varchar(20), 
	from_date varchar(20),
	to_date varchar(20)
);

create table dept_manager(
	dept_no varchar(20), 
	emp_no int,
	from_date varchar(20),
	to_date varchar(20)
);

create table employees(
	emp_no int PRIMARY KEY,
	birth_date varchar(20),
	first_name varchar(20),
	last_name varchar(20),
	gender varchar(1),
	hire_date varchar(20)
);

create table salaries(
	emp_no int PRIMARY KEY,
	salary int,
	from_date varchar(20),
	to_date varchar(20)
);

create table titles(
	emp_no int,
	title varchar(20),
	from_date varchar(20),
	to_date varchar(20)
);

-- Import process: Databases > EmployeeSQL > Schwmas > Tables > right click > Import/Export, select appropriate csv
-- Make sure imports were correct
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;