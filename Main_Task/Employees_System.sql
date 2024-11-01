CREATE SCHEMA hr;

CREATE TABLE hr.Employees
(
	Employee_Id INT PRIMARY KEY,
	First_Name VARCHAR(20),
	Last_Name VARCHAR(25),
	Email VARCHAR(25),
	Phone_Number VARCHAR(20),
	Hire_Date DATETIME,
	Job_Id VArCHAR(10),
	Salary DECIMAL,
	Commision_PCT INT,
	Manager_Id INT,
	Department_Id INT,
	FOREIGN KEY (Manager_Id) REFERENCES Employees(Employee_Id),
);
CREATE TABLE hr.Regions
(
	Region_id INT PRIMARY KEY,
	Region_Name VARCHAR(25),
);
CREATE TABLE hr.Jobs
(
	Job_Id INT PRIMARY KEY,
	Job_Title VARCHAR(35),
	Min_Salary DECIMAL,
	Max_Salary DECIMAL,
);
CREATE TABLE hr.Locations
(
	Location_Id INT PRIMARY KEY,
	Street_Address VARCHAR(25),
	Postal_Code VARCHAR(12),
	City VARCHAR(30),
	State_Province VARCHAR(12),
	Country_Id VARCHAR(2),
);
CREATE TABLE hr.Departments
(
	Department_Id INT PRIMARY KEY,
	Department_Name VARCHAR(20),
	Manager_Id INT,
	Location_Id INT,
	FOREIGN KEY (Manager_Id) REFERENCES Employees(Employee_Id),
	FOREIGN KEY (Location_Id) REFERENCES Locations(Location_Id)
);
CREATE TABLE hr.Job_History
(
	Employee_Id INT,
	Start_Date DATETIME,
	End_Date DATETIME,
	Job_Id INT,
	Department_Id INT,
	PRIMARY KEY(Employee_Id, Start_Date),
	FOREIGN KEY (Department_Id) REFERENCES Departments(Department_Id),
	FOREIGN KEY (Job_Id) REFERENCES Jobs(Job_Id)
);
CREATE TABLE Countries
(
	Country_Id VARCHAR(2) PRIMARY KEY,
	Country_Name VARCHAR(40),
	Regoin_Id INT,
	FOREIGN KEY (Regoin_Id) REFERENCES Regions(Region_id)
);
CREATE TABLE hr.Job_Grades
(
	Grade_Level VARCHAR(2) PRIMARY KEY,
	Lowest_Sal DECIMAL,
	Highest_Sal DECIMAL
);
ALTER TABLE hr.Employees ADD CONSTRAINT EMP_DEP FOREIGN KEY
(Department_Id) REFERENCES Departments
(Department_Id);
ALTER TABLE hr.Employees ADD CONSTRAINT EMP_MGR FOREIGN KEY
(Manager_Id) REFERENCES Employees
(Employee_Id);
ALTER TABLE hr.Locations ADD CONSTRAINT CON_ID FOREIGN KEY 
(Country_Id) REFERENCES Countries
(Country_Id);