CREATE TABLE Employees (
    "emp_no" int   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);
select * from Employees


CREATE TABLE Titles (
    "emp_no" int   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);
select * from Titles



CREATE TABLE Salaries (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" VARCHAR   NOT NULL,
    "to_date" VARCHAR   NOT NULL
);
Select * from Salaries



CREATE TABLE Departments (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);
select * from Departments 



CREATE TABLE Dept_Employee (
    "emp_no" int,
    "dept_no" VARCHAR,
    "from_date" VARCHAR,
    "to_date" VARCHAR
);
select * from Dept_Employee



CREATE TABLE Dept_Manager (
    "dept_no" VARCHAR,
    "emp_no" int,
    "from_date" VARCHAR,
    "to_date" VARCHAR
);
select * from Dept_Manager




ALTER TABLE Titles ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

ALTER TABLE Salaries ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

ALTER TABLE Dept_Employee ADD CONSTRAINT "fk_Dept_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

ALTER TABLE Dept_Employee ADD CONSTRAINT "fk_Dept_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES Departments ("dept_no");

ALTER TABLE Dept_Manager ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES Departments ("dept_no");

ALTER TABLE Dept_Manager ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

--------------------------------------------------------------------------------------------

-- 1) List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
from Employees as e
join Salaries as s 
on e.emp_no = s.emp_no 

-- 2) List employees who were hired in 1986.

select last_name, first_name, hire_date
from Employees
where hire_date like '1986%'

-- 3) List the manager of each department with the following information: department number,
-- department name, the manager's employee number, last name, first name, and start and end employment dates.


select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, de.from_date, de.to_date
from Employees as e
join Dept_Employee as de
on e.emp_no = de.emp_no
join Departments as d
on d.dept_no = de.dept_no
join Dept_Manager as dm
on e.emp_no = dm.emp_no
 
 
 -- 4) List the department of each employee with the following information: employee number, 
 --    last name, first name, and department name.

select e.emp_no, e.first_name, e.last_name, d.dept_name
from Employees as e
join Dept_Employee as de
on e.emp_no = de.emp_no
join Departments as d 
on de.dept_no = d.dept_no


-- 5) List all employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name 
from Employees
where first_name = 'Hercules' and last_name like 'B%'


-- 6) List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name.


select e.emp_no, e.first_name, e.last_name, d.dept_name
from Employees as e
join Dept_Employee as de
on e.emp_no = de.emp_no
join Departments as d 
on de.dept_no = d.dept_no
where dept_name = 'Sales'


-- 7) List all employees in the Sales and Development departments, including their employee number, 
--  last name, first name, and department name. 

select e.emp_no, e.first_name, e.last_name, d.dept_name
from Employees as e
join Dept_Employee as de
on e.emp_no = de.emp_no
join Departments as d 
on de.dept_no = d.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

-- 8) In descending order, list the frequency count of employee last names, i.e., 
--    how many employees share each last name.

select last_name, count(last_name) as name_count
from Employees
group by last_name
order by name_count DESC





 
 
 
 
 
 
 
 
 
 
 






