-- Select all records from the 'titles' table
SELECT * FROM titles;

-- Select all records from the 'employees' table
SELECT * FROM employees;

-- Select all records from the 'departments' table
SELECT * FROM departments;

-- Select all records from the 'salaries' table
SELECT * FROM salaries;

-- Select all records from the 'dept_emp' table
SELECT * FROM dept_emp;

-- Select all records from the 'dept_manager' table
SELECT * FROM dept_manager;


-- Exercises:
-- 1.List the employee number, last name, first name, sex, and salary of each employee 

SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary 
FROM employees
JOIN salaries 
	ON employees.emp_no=salaries.emp_no
ORDER BY emp_no;

-- 2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, 
       last_name, 
       hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3List the manager of each department along
-- with their department number, department name, employee number, last name, and first name 
SELECT titles.title,
	departments.dept_no,
    departments.dept_name,
    dept_manager.emp_no AS manager_emp_no,
    employees.last_name AS manager_last_name,
    employees.first_name AS manager_first_name
FROM departments
INNER JOIN  dept_manager
	ON departments.dept_no=dept_manager.dept_no 
INNER JOIN employees
	ON dept_manager.emp_no=employees.emp_no
INNER JOIN titles ON employees.emp_title_id = titles.title_id
WHERE titles.title = 'Manager';
	
	
-- 4List the department number for each employee 
-- along with that employee’s employee number, last name, first name, and department name 

SELECT departments.dept_no,employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name AS department_name
FROM employees
INNER JOIN dept_emp
    ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
    ON dept_emp.dept_no = departments.dept_no;

-- 5List first name, last name, 
-- and sex of each employee whose first name is
--Hercules and whose last name begins with the letter B
SELECT employees.first_name,
	   employees.last_name,
       employees.sex
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%'


-- 6List each employee in the Sales department, 
-- including their employee number, last name, and first name
SELECT departments.dept_name,employees.emp_no,
    employees.last_name,
    employees.first_name
FROM employees
INNER JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
	ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name='Sales'
ORDER BY emp_no;


-- 7List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name

SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM employees
INNER JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
	ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development')
	ORDER BY emp_no;
	
	
-- 8List the frequency counts, in descending order, of all the employee last names 

SELECT last_name, COUNT(*) as name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;