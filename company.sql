CREATE TABLE Department (
  DepartmentID INTEGER PRIMARY KEY,
  DepartmentName VARCHAR(255) NOT NULL,
  PhoneNumber VARCHAR(255) NOT NULL
);

CREATE TABLE Employee (
  EmployeeID INTEGER PRIMARY KEY,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  DateOfBirth DATE NOT NULL,
  DepartmentID INTEGER NOT NULL,
  JobTitle VARCHAR(255) NOT NULL,
  PhoneNumber VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE EmployeeWedding (
  EmployeeID INTEGER PRIMARY KEY,
  SpouseID INTEGER NOT NULL,
  WeddingDate DATE NOT NULL,
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (SpouseID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Skill (
  SkillID INTEGER PRIMARY KEY,
  SkillName VARCHAR(255) NOT NULL,
	Description VARCHAR(255) NOT NULL
);

CREATE TABLE EmployeeSkill (
  EmployeeID INTEGER NOT NULL,
  SkillID INTEGER NOT NULL,
  PRIMARY KEY (EmployeeID, SkillID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (SkillID) REFERENCES Skill(SkillID)
);

CREATE TABLE Project (
  ProjectID INTEGER PRIMARY KEY,
  ProjectName VARCHAR(255) NOT NULL,
  TotalBudget DECIMAL(10, 2) NOT NULL
);

CREATE TABLE EmployeeProject (
  EmployeeID INTEGER NOT NULL,
  ProjectID INTEGER NOT NULL,
  Role VARCHAR(255) NOT NULL,
  PRIMARY KEY (EmployeeID, ProjectID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

CREATE TABLE ProjectSkill (
  ProjectSkillID INTEGER PRIMARY KEY,
  ProjectID INTEGER NOT NULL,
  SkillID INTEGER NOT NULL,
  FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
  FOREIGN KEY (SkillID) REFERENCES Skill(SkillID)
);

CREATE TABLE Equipment (
  EquipmentID INTEGER PRIMARY KEY,
  EquipmentName VARCHAR(255) NOT NULL,
  DepartmentID INTEGER NOT NULL,
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Supplier (
  SupplierID INTEGER PRIMARY KEY,
  SupplierName VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  PhoneNumber VARCHAR(255) NOT NULL
);

CREATE TABLE EquipmentSupplier (
  EquipmentID INTEGER NOT NULL,
  SupplierID INTEGER NOT NULL,
	LastWorkingDate DATE,
  PRIMARY KEY (EquipmentID, SupplierID),
  FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID),
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE Country (
  CountryID INTEGER PRIMARY KEY,
  CountryName VARCHAR(255) NOT NULL,
  Population INTEGER NOT NULL
);

CREATE TABLE Employment (
  EmploymentID INTEGER PRIMARY KEY,
  EmployeeID INTEGER NOT NULL,
  CountryID INTEGER NOT NULL,
  Income DECIMAL(10, 2) NOT NULL,
  ContractStartDate DATE NOT NULL,
  ContractEndDate DATE NOT NULL,
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

-- Add data

-- Insert data into the Department table
INSERT INTO Department (DepartmentID, DepartmentName, PhoneNumber)
VALUES (1, 'Marketing', '555-555-1212'),
       (2, 'Sales', '555-555-1213'),
       (3, 'Engineering', '555-555-1214'),
       (4, 'HR', '555-555-1215'),
       (5, 'Finance', '555-555-1216'),
       (6, 'IT', '555-555-1217'),
       (7, 'Legal', '555-555-1218'),
       (8, 'Operations', '555-555-1219'),
       (9, 'Customer Support', '555-555-1220'),
       (10, 'Research & Development', '555-555-1221'),
       (11, 'Business Development', '555-555-1222');

-- Insert data into the Skill table
INSERT INTO Skill (SkillID, SkillName, Description)
VALUES (1, 'Project Management', 'Ability to manage and coordinate projects from start to finish'),
       (2, 'Programming', 'Ability to write and debug code in various programming languages'),
       (3, 'Data Analysis', 'Ability to analyze and interpret data using statistical techniques and software'),
       (4, 'Design', 'Ability to create visual designs using software such as Adobe Creative Suite'),
       (5, 'Writing', 'Ability to write clear and compelling content for various mediums'),
       (6, 'Marketing', 'Ability to develop and execute marketing campaigns and strategies'),
       (7, 'Sales', 'Ability to identify and pursue sales leads and close deals'),
       (8, 'Customer Service', 'Ability to assist and resolve customer inquiries and complaints'),
       (9, 'Accounting', 'Ability to perform financial tasks such as budgeting and bookkeeping'),
       (10, 'Legal', 'Ability to advise on and interpret laws and regulations'),
       (11, 'Research', 'Ability to conduct research and gather information from various sources');

-- Insert data into the Employee table
INSERT INTO Employee (EmployeeID, FirstName, LastName, DateOfBirth, DepartmentID, JobTitle, PhoneNumber, Address)
VALUES (1, 'John', 'Doe', '1980-01-01', 1, 'Marketing Manager', '555-555-1223', '123 Main St'),
       (2, 'Jane', 'Doe', '1985-02-14', 2, 'Sales Representative', '555-555-1224', '456 Main St'),
       (3, 'Bob', 'Smith', '1990-03-21', 3, 'Software Engineer', '555-555-1225', '789 Main St'),
       (4, 'Alice', 'Smith', '1995-04-28', 4, 'HR Manager', '555-555-1226', '321 Main St'),
       (5, 'Charlie', 'Johnson', '2000-05-05', 5, 'Financial Analyst', '555-555-1227', '654 Main St'),
       (6, 'Sara', 'Williams', '1998-08-16', 11, 'Business Development Representative', '555-555-1322', '246 Main St');
 
 -- Insert data into the EmployeeSkill table
INSERT INTO EmployeeSkill (EmployeeID, SkillID)
VALUES (1, 1), 
       (1, 5),  
       (1, 6),  
       (2, 7), 
       (3, 2), 
       (3, 3), 
       (4, 4), 
       (4, 9),  
       (5, 10), 
       (5, 8),
       (6, 11);

-- Insert data into the EmployeeProject table
INSERT INTO EmployeeProject (EmployeeID, ProjectID, Role)
VALUES (1, 1, 'Project Manager'), 
       (2, 1, 'Sales Representative'),  
       (3, 1, 'Software Engineer'),  
       (4, 1, 'HR Manager'), 
       (5, 1, 'Financial Analyst'), 
       (6, 11, 'Business Development Representative'); 
			
-- Insert data into the ProjectSkill table
INSERT INTO ProjectSkill (ProjectID, SkillID)
VALUES (1, 1), 
       (1, 2), 
       (1, 3), 
       (1, 4),  
       (1, 5), 
       (1, 6), 
       (1, 7),  
       (1, 8),  
       (1, 9), 
       (1, 10),
       (1, 11),
       (2, 1);
			
-- Insert data into the Project table
INSERT INTO Project (ProjectID, ProjectName, TotalBudget)
VALUES (1, 'Website Redesign', 100000),
       (2, 'New Product Launch', 200000),
       (3, 'Marketing Campaign', 300000),
       (4, 'Software Development', 400000),
       (5, 'HR System Implementation', 500000),
       (6, 'Financial Audit', 600000),
       (7, 'Customer Support Upgrade', 700000),
       (8, 'Operations Efficiency Improvement', 800000),
       (9, 'Legal Review', 900000),
       (10, 'Research & Development', 1000000),
       (11, 'Business Development Initiative', 1100000);

-- Insert data into the Country table
INSERT INTO Country (CountryID, CountryName, Population)
VALUES (1, 'Ho Chi Minh City', 9000000),
       (2, 'Hanoi', 7600000),
       (3, 'Da Nang', 1300000),
       (4, 'Can Tho', 1200000),
       (5, 'Haiphong', 2100000),
       (6, 'Nha Trang', 390000),
       (7, 'Thua Thien-Hue', 340000),
       (8, 'Quy Nhon', 330000),
       (9, 'Ba Ria-Vung Tau', 280000),
       (10, 'Lam Dong', 240000),
       (11, 'Gia Lai', 220000); 

-- Insert data into the Employment table		 
INSERT INTO Employment (EmploymentID, EmployeeID, CountryID, Income, ContractStartDate, ContractEndDate)
VALUES (1, 1, 1, 75000, '2022-01-01', '2023-01-01'),  
       (2, 2, 2, 60000, '2022-02-01', '2023-02-01'), 
       (3, 3, 4, 50000, '2022-03-01', '2023-03-01'),  
       (4, 4, 6, 65000, '2022-04-01', '2023-04-01'), 
       (5, 5, 4, 55000, '2022-05-01', '2023-05-01'), 
       (6, 6, 11, 40000, '2022-12-01', '2023-12-01'); 

-- Insert data into the Supplier table
INSERT INTO Supplier (SupplierID, SupplierName, Address, PhoneNumber)
VALUES (1, 'ACME Inc.', '123 Main Street', '555-555-1212'),
       (2, 'XYZ Corp.', '456 Market Street', '555-555-1234'),
       (3, 'FooBar Inc.', '789 Washington Ave', '555-555-5678'),
       (4, 'AbcDef Co.', '246 Park Place', '555-555-9101'),
       (5, '123 Inc.', '159 Maple Street', '555-555-1122');		 
			 

-- Insert data into the Equipment table
INSERT INTO Equipment (EquipmentID, EquipmentName, DepartmentID)
VALUES (1, 'Laptop', 1),
       (2, 'Desktop', 1),
       (3, 'Printer', 2),
       (4, 'Scanner', 2),
       (5, 'Projector', 3),
       (6, 'Whiteboard', 3),
       (7, 'Telephone', 4);
			 
 -- Insert data into the EquipmentSupplier table
INSERT INTO EquipmentSupplier (EquipmentID, SupplierID, LastWorkingDate)
VALUES (1, 1, '2021-01-01'),  
       (2, 2, '2021-02-01'),  
       (3, 3, '2021-03-01'), 
       (4, 4, '2021-04-01'), 
       (5, 1, '2021-05-01'),  
       (6, 2, '2021-06-01'),  
       (7, 5, '2021-07-01');  
			 
			 
-- Some query


--    To retrieve a list of all employees and their department names:

SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID


--    To retrieve a list of all employees and their skills:

SELECT e.FirstName, e.LastName, s.SkillName
FROM Employee e
JOIN EmployeeSkill es ON e.EmployeeID = es.EmployeeID
JOIN Skill s ON es.SkillID = s.SkillID


--    To retrieve a list of all projects and the skills required for each project:

SELECT p.ProjectName, s.SkillName
FROM Project p
JOIN ProjectSkill ps ON p.ProjectID = ps.ProjectID
JOIN Skill s ON ps.SkillID = s.SkillID

--     To retrieve a list of all employees and the projects they are working on:

SELECT e.FirstName, e.LastName, p.ProjectName, ep.Role
FROM Employee e
JOIN EmployeeProject ep ON e.EmployeeID = ep.EmployeeID
JOIN Project p ON ep.ProjectID = p.ProjectID
