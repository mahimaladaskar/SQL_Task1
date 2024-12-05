/* Task 1: Create a table named Employee Details with the following 10 columns and use
   suitable constraint for every column:
   • EmployeeID (Serial)
   • FirstName (VARCHAR, maximum 50 characters)
   • LastName (VARCHAR, maximum 50 characters)
   • Email (VARCHAR, maximum 100 characters)
   • PhoneNumber (VARCHAR, maximum 15 characters)
   • HireDate (DATE)
   • Salary (DECIMAL, with precision 10 and scale 2)
   • DepartmentID (Integer)
   • IsActive (BOOLEAN)
   • JobTitle (VARCHAR, maximum 100 characters)*/

create table Employee_details 
(
EmployeeID serial primary key,
FirstName varchar(50) not null,	
LastName varchar(50) not null,
Email varchar(100),
PhoneNumber	varchar(15),
HireDate date,
Salary Decimal(10,2),
DepartmentID int,
IsActive boolean,	
JobTitle varchar(100)
);

/*   Task 2: Insert data into the Employee_Details Table
     1. Insert at least 5 rows of data into the Employee_Details table created in Task 1.
     2. Use meaningful data for each column, making sure the EmployeeID is unique, Salary is
     realistic, and the HireDate is in a valid date format.
     3. Write the SQL queries to insert the data. */


INSERT INTO Employee_details VALUES(1,'Sunita','Yadav','sunita.yadav@example.com','9843216547','2020-06-01',30000,1,'Yes','Administrative Assistant'),
(2,'Aditi','Sharma','aditi.sharma@example.com','9876543210','2020-03-10',50000,2,'Yes','Software Engineer'),
(3,'Rohan','Verma','rohan.verma@example.com','9123456789','2020-06-01',35000,1,'Yes','HR Manager'),
(4,'Priya','Singh','priya.singh@example.com','9987654321','2018-05-18',60000,3,'No','Financial Analyst'),
(5,'Sameer','Patel','sameer.patel@example.com','9812345678','2021-09-24',35000,4,'Yes','QA Engineer');

select * from Employee_details; -- retrive all the data

/* Task 3: Insert Data from a CSV File into the SQL Table
        1. Insert data from a CSV file into the existing Employee_Details table that you created in
        Task 1.*/

Copy Employee_details from 'C:/Users/Dell/Downloads/Employee_Details (1).csv' delimiter ',' csv header;


/*  Task 4: Update the Employee_Details Table
         1. Update the EmployeeDetails table by setting the DepartmentID to 0 for all employees
         where IsActive is set to False.*/

Update Employee_details 
set DepartmentID = 0 
where IsActive = 'false';


/* Task 5: Update the Employee_Details Table - Salary Increment
        1. Increase the Salary by 8% for employees who meet the following conditions:
        • IsActive = False
        • DepartmentID = 0
        • JobTitle is one of the following:
        1. HR Manager 2. Financial Analyst 3. Business Analyst 4. Data Analyst */


Update Employee_details 
set salary = salary+(salary*8/100)
where IsActive = 'False' and DepartmentID = 0 and JobTitle in ('HR Manager','Financial Analyst','Business Analyst','Data Analyst');


/*  Task 6: Query to Find Employees with Custom Column Names
         1. Retrieve the FirstName and LastName of employees whose Salary is between
		 30,000 and 50,000 and display the results as Name (for FirstName) and Surname (for
         LastName). */


select FirstName as Name,LastName as Surname
from Employee_details
where salary between 30000 and 50000;


/*  Task 7: Query to Find Employees Whose FirstName Starts with 'A'
         1. Retrieve all data from the Employee_Details table where the FirstName starts with
         the letter 'A'. */


Select * from Employee_details
where FirstName like 'A%';

 
 /* Task 8: Delete Rows with EmployeeID from 1 to 5
         1. Delete the rows from the Employee_Details table where the EmployeeID is between
         1 and 5. */


Delete from Employee_details
where EmployeeID between 1 and 5;


/*  Task 9: Rename Table and Columns
         1. Change the name of the table and specific column names in the existing database
         structure to enhance clarity.
         Instructions:
         1. Rename the table from Employee_Details to employee_database.*/


Alter table Employee_details
Rename to employee_database;


 /*2. Rename the columns as follows:
    o Change FirstName to Name.
    o Change LastName to Surname. */


Alter table employee_database
Rename column FirstName to Name;


Alter table employee_database
Rename column LastName to Surname;


/*  Task 10: Add State Column and Update Data in PostgreSQL
         1. Enhance the employee_database table by adding a new column for State and
         populating it based on the IsActive status of employees.
         Instructions
         1. Add a new column named State with the following specifications:
         o Data type: VARCHAR
         o Constraint: NOT NULL*/

Alter table Employee_database
add column State varchar not null default 'unknown';


/* 2. Update the State column with the following conditions:
   o Set State to 'India' for all employees where IsActive is TRUE.
   o Set State to 'USA' for all employees where IsActive is FALSE. */


Update Employee_database 
set State = 'India'
where IsActive = 'true';


Update Employee_database 
set State = 'USA'
where IsActive = 'false';




