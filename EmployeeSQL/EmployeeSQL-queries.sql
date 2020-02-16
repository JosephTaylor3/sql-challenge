-- List the following details of each employee: employee number, last name, first name, gender, and salary
	-- Join the employees and salaries tables and select needed columns
	-- note to self: excel count after running SQL query confirms there are 300024 records
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

-- List employees who were hired in 1986
	-- query using where, like and wildcard character
select * from employees where hire_date like '1986%';

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.
	-- note to self: order the column selection in the order you want it to appear after the joins
	-- note to self: review of the csv confirms there are 24 records 
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date  
from dept_manager
LEFT JOIN departments ON
dept_manager.dept_no=departments.dept_no
LEFT JOIN employees ON
dept_manager.emp_no=employees.emp_no

-- List the department of each employee with the following information: employee number, last name, first name, 
-- and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name  
from employees
LEFT JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
LEFT JOIN departments ON
dept_emp.dept_no=departments.dept_no

-- List all employees whose first name is "Hercules" and last names begin with "B."
	-- note to self: excel filtering after running sequel query confirms there are 20 records 
SELECT employees.first_name, employees.last_name from employees where first_name = 'Hercules' AND last_name like 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
	-- note to self: excel filtering after running SQL query confirms there are 52245 records of d007 Sales dept. 
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from employees
LEFT JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
LEFT JOIN departments ON
dept_emp.dept_no=departments.dept_no
where dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
	-- note to self: excel filtering after running SQL query confirms there are 137952 records of d007 and d005. 
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from employees
LEFT JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
LEFT JOIN departments ON
dept_emp.dept_no=departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
	-- solution has been ordered alphabetically by last name 
	-- note to self: a spot check in excel after running the sql query confirms the counts are correct 
select last_name, count(last_name) from employees
group by last_name
order by last_name



-- BONUS: create table for bonus exercise for histogram of salaries by title

create table salarybytitle(
	title varchar(20),
	salary int
);

select AVG(salaries.salary), titles.title 
from salaries
LEFT JOIN titles ON
salaries.emp_no=titles.emp_no
Group by title

INSERT INTO salarybytitle (title, salary)
VALUES ('Assistant Engineer', 48493.2048),
	('Engineer', 48539.7814),
	('Manager', 51531.0417),
	('Senior Engineer', 48506.7518),
	('Senior Staff', 58503.2866),
	('Staff', 58465.2719),
	('Technique Leader', 48580.5058);
	
select * from salarybytitle;