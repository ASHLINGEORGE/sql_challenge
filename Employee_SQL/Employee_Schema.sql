-- Create the 'titles' table
CREATE TABLE titles(
					title_id VARCHAR(5) PRIMARY KEY NOT NULL,
					title VARCHAR(18) NOT NULL
);


-- Create the 'employees' table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(14) NOT NULL,
    last_name VARCHAR(16) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


-- Create the 'departments' table
CREATE TABLE departments (
						dept_no  VARCHAR(4) PRIMARY KEY NOT NULL,
						dept_name VARCHAR(18) NOT NULL
);


-- Create the 'salaries' table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

	
-- Create the 'dept_emp' table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),-- Define a composite key using 'emp_no' and 'dept_no'
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create the 'dept_manager' table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT PRIMARY KEY NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
