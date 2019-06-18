-- create employees table

CREATE TABLE Employees (
    empID SERIAL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    gender CHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        empID
     )
);

-- create titles table

CREATE TABLE Titles (
    empID INTEGER   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

-- create salaries table

CREATE TABLE Salaries (
    empID INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

-- create departments table

CREATE TABLE Departments (
    deptID CHAR(4) UNIQUE,
    dept_name VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        deptID
     )
);

-- create dept_employee junction table 
-- since this is a junction table specify unique combination of all the columns

CREATE TABLE Dept_Employee (
    empID INTEGER   NOT NULL,
    deptID CHAR(4)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE  NOT NULL,
	UNIQUE (empID, deptID, from_date, to_date)
);

-- create dept_manager table

CREATE TABLE Dept_Manager (
    deptID CHAR(4)   NOT NULL,
    empID INTEGER   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

-- create employee id foreign key in titles table to relate employees with titles

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_empID FOREIGN KEY(empID)
REFERENCES Employees (empID);

-- create employee id foreign key in salaries table to relate employees to salaries

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_empID FOREIGN KEY(empID)
REFERENCES Employees (empID);

-- create employee id foreign key in dept_employee junction table

ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_empID FOREIGN KEY(empID)
REFERENCES Employees (empID);

-- create department id foreign key in dept_employee junction table

ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_deptID FOREIGN KEY(deptID)
REFERENCES Departments (deptID);

-- create department id foreign key in dept_manager table to relate dept_manager to department

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_deptID FOREIGN KEY(deptID)
REFERENCES Departments (deptID);

-- create employee id foreign key in dept_manager table to relate managers to employees

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_empID FOREIGN KEY(empID)
REFERENCES Employees (empID);