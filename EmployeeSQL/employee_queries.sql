--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,
    employees.last_name, 
    employees.first_name, 
    employees.sex,
    salaries.salary
FROM employees
INNER JOIN salaries 
on employees.emp_no = salaries.emp_no
;


--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,
    last_name,
    hire_date
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31'
;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_managers.dept_no,
    departments.dept_name,
    employees.emp_no,
    employees.last_name,
    employees.first_name
FROM dept_managers
JOIN departments
on dept_managers.dept_no = departments.dept_no
JOIN employees
on dept_managers.emp_no = employees.emp_no
;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM dept_managers
JOIN departments
on dept_managers.dept_no = departments.dept_no
JOIN employees
on dept_managers.emp_no = employees.emp_no 
;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,
    last_name,
    sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%'
;

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM employees
JOIN dept_emp
on employees.emp_no = dept_emp.emp_no
JOIN departments
on dept_emp.dept_no = departments.dept_no
WHERE dept_name like '%Sales%'
;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM employees
JOIN dept_emp
on employees.emp_no = dept_emp.emp_no
JOIN departments
on dept_emp.dept_no = departments.dept_no
WHERE dept_name in ('Sales', 'Development')
;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT (last_name) as name_count,
    employees.last_name,
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT (last_name) DESC 
;