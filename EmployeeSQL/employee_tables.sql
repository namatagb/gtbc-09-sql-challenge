--Drop table if exists
DROP TABLE departments
;

--Create new table
CREATE TABLE departments(
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR NOT NULL,
);

-- View table columns and imported data
SELECT * 
FROM departments
;

--Drop table if exists
DROP TABLE titles
;

--Create new table
CREATE TABLE titles(
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR NOT NULL
);

-- View table columns and imported data
SELECT * 
FROM titles
;

--Drop table if exists
DROP TABLE employees
;

--Create new table
CREATE TABLE employees(
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
    );

-- View table columns and imported data
SELECT * 
FROM employees
;

--Drop table if exists
DROP TABLE dept_emp
;

--Create new table
CREATE TABLE dept_emp(
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- View table columns and imported data
SELECT * 
FROM dept_emp
;

--Drop table if exists
DROP TABLE dept_managers
;

--Create new table
CREATE TABLE dept_managers(
    dept_no VARCHAR,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERNCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- View table columns and imported data
SELECT * 
FROM dept_managers
;

--Drop table if exists
DROP TABLE salaries
;

--Create new table
CREATE TABLE salaries(
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- View table columns and imported data
SELECT * 
FROM salaries
;