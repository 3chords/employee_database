-- List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.empid, e.last_name, e.first_name, e.gender, s.salary
from employees as e
inner join salaries as s
on e.empid = s.empid;

-- List employees who were hired in 1986

select * from employees
where hire_date >= '1/1/1986' and hire_date <= '12/31/1986';


-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
-- this gets the current managers not past managers

select dm.empid
	, dm.deptid
	, e.hire_date
	, dm.from_date
	, dm.to_date
	, d.dept_name
	, e.last_name
	, e.first_name
from dept_manager as dm
inner join departments as d
	on dm.deptid = d.deptid
inner join employees as e
	on dm.empid = e.empid
	where dm.to_date = '9999-01-01';

-------------------------------------------

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
-- note, this grabs only current employees

select e.empid
	, e.last_name
	, e.first_name
	, d.dept_name
	, de.to_date
from employees as e
inner join dept_employee as de
	on e.empid = de.empid
inner join departments as d
	on de.deptid = d.deptid
	where de.to_date = '9999-01-01';


-- List all employees whose first name is "Hercules" and last names begin with "B."

select e.first_name, e.last_name
from employees as e
where e.first_name like 'Hercules' and e.last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- this gets all CURRENT sales employees

select e.empid
	, e.last_name
	, e.first_name
	, d.dept_name
	, de.to_date
from employees as e
inner join dept_employee as de
	on e.empid = de.empid
inner join departments as d
	on de.deptid = d.deptid
	where d.dept_name = 'Sales' and de.to_date = '9999-01-01';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, 
-- and department name.

select e.empid
	, e.last_name
	, e.first_name
	, d.dept_name
	, de.to_date
from employees as e
inner join dept_employee as de
	on e.empid = de.empid
inner join departments as d
	on de.deptid = d.deptid
	where d.dept_name in ('Sales', 'Development') and de.to_date = '9999-01-01';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(empid)
from employees
group by last_name
order by count(empid) DESC;

