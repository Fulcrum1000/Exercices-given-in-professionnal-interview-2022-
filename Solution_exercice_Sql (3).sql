-- Designed on Visual Studio Code
-- Tested on both PostgresSQL Local Database and Dbeaver SQLite
-- Timme spent on this method : 47 min (including testing time)

-- TABLE EMPLOYEE
CREATE TABLE IF NOT EXISTS employee_table
(Id INT,
Name VARCHAR (20),
Salary INT,
DepartmentId INT)
-- the table is launched in two times : first Creation, then Insert
INSERT INTO employee_table (Id,Name,Salary,DepartmentId) VALUES
(1,'Joe',85000,1),
(2, 'Henry',80000,2),
(3, 'Sam',60000,2),
(4, 'Max',90000,1),
(5,'Janet',69000,1),
(6,'Randy',85000,1),
(7,'Will',70000,1)

-- note of the author : Specifications like cluster, storage and TBLProperties could be set up for all of these tables if they are not created locally
-- TABLE DEPARTMENT
CREATE TABLE IF NOT EXISTS department_table
(Id INT,
Name VARCHAR (20))
-- the table is launched in two times : first Creation, then Insert
INSERT INTO department_table (Id,Name) VALUES
(1,'IT'),
(2,'Sales')

-- TABLE SOLUTION
CREATE TABLE IF NOT EXISTS solution_table
(Department VARCHAR(20),
Employee VARCHAR(20),
Salary INT)
-- the table is launched in two times : first Creation, then Insert
INSERT INTO solution_table 
Select Department, Employee, salary FROM (
select
 distinct(D.Name) as Department, --Why putting a DISTINCT here => the goal here is preventing the apparition of duplicates, given the presence of an inner join later
 E.Name as Employee,
 E.Salary as Salary,
 DENSE_RANK() OVER (PARTITION BY D.Name ORDER BY E.Salary DESC) AS ed_order --This function allows me to select an ordered list of all salaries and Departments. 
 --It is easier to apply this listing than to create several max loops.
 from employee_table E
 inner join department_table D on E.DepartmentId=D.Id) 
 A WHERE A.ed_order <= 3 -- Here i'm basically selecting the top 3 biggest salaries per Department
 ORDER BY Department ASC,
 Salary DESC --Biggest salaries will come first

 -- TESTING TABLE SOLUTION

 Select *
 from solution_table 
 
 -- DELETING ALL TABLES

DROP TABLE employee_table
DROP TABLE department_table
DROP TABLE solution_table


