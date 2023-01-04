CREATE TABLE Department (
  id INTEGER PRIMARY KEY,
  department_name VARCHAR(255) UNIQUE NOT NULL,
  phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE Employee (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  department_id INTEGER NOT NULL,
  job_title VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  FOREIGN KEY (department_id) REFERENCES Department(id)
);

CREATE TABLE EmployeeWedding (
  id INTEGER PRIMARY KEY,
  employee_id INTEGER NOT NULL,
  spouse_id INTEGER NOT NULL,
  wedding_date DATE NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES Employee(id),
  FOREIGN KEY (spouse_id) REFERENCES Employee(id)
);

CREATE TABLE Skill (
  id INTEGER PRIMARY KEY,
  skill_name VARCHAR(255) NOT NULL,
	description VARCHAR(255) NOT NULL
);

CREATE TABLE Employee_Skill (
  id INTEGER PRIMARY KEY,
  employee_id INTEGER NOT NULL,
  skill_id INTEGER NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES Employee(id),
  FOREIGN KEY (skill_id) REFERENCES Skill(id)
);

CREATE TABLE Project (
  id INTEGER PRIMARY KEY,
  project_name VARCHAR(255) NOT NULL,
  total_budget DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Employee_Project (
  id INTEGER PRIMARY KEY,
  employee_id INTEGER NOT NULL,
  project_id INTEGER NOT NULL,
  role VARCHAR(255) NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES Employee(id),
  FOREIGN KEY (project_id) REFERENCES Project(id)
);

CREATE TABLE Project_Skill (
  id INTEGER PRIMARY KEY,
  project_id INTEGER NOT NULL,
  skill_id INTEGER NOT NULL,
  FOREIGN KEY (project_id) REFERENCES Project(id),
  FOREIGN KEY (skill_id) REFERENCES Skill(id)
);

CREATE TABLE Equipment (
  id INTEGER PRIMARY KEY,
  equipment_name VARCHAR(255) NOT NULL,
  department_id INTEGER NOT NULL,
  FOREIGN KEY (department_id) REFERENCES Department(id)
);

CREATE TABLE Supplier (
  id INTEGER PRIMARY KEY,
  supplier_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE Equipment_Supplier (
	id INTEGER PRIMARY KEY,
  equipment_id INTEGER NOT NULL,
  supplier_id INTEGER NOT NULL,
	last_working_date DATE,
  FOREIGN KEY (equipment_id) REFERENCES Equipment(id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(id)
);

CREATE TABLE Country (
  id INTEGER PRIMARY KEY,
  country_name VARCHAR(255) NOT NULL,
  population INTEGER NOT NULL
);

CREATE TABLE Employment (
  id INTEGER PRIMARY KEY,
  employee_id INTEGER NOT NULL,
  country_id INTEGER NOT NULL,
  income DECIMAL(10, 2) NOT NULL,
  contract_start_date DATE NOT NULL,
  contract_end_date DATE NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES Employee(id),
  FOREIGN KEY (country_id) REFERENCES Country(id)
);


-- add INDEX

CREATE INDEX idx_department_name ON Department(department_name);
CREATE INDEX idx_employee_name ON Employee(first_name, last_name);
CREATE INDEX idx_employee_department_id ON Employee(department_id);
CREATE INDEX idx_employee_wedding_spouses ON EmployeeWedding(employee_id, spouse_id);
CREATE INDEX idx_skill_name ON Skill(skill_name);
CREATE INDEX idx_employee_skill ON Employee_Skill(employee_id, skill_id);
CREATE INDEX idx_project_name ON Project(project_name);
CREATE INDEX idx_employee_project ON Employee_Project(employee_id, project_id);
CREATE INDEX idx_project_skill ON Project_Skill(project_id, skill_id);
CREATE INDEX idx_equipment_name ON Equipment(equipment_name);
CREATE INDEX idx_equipment_department_id ON Equipment(department_id);
CREATE INDEX idx_supplier_name ON Supplier(supplier_name);
CREATE INDEX idx_equipment_supplier ON Equipment_Supplier(equipment_id, supplier_id);
CREATE INDEX idx_country_name ON Country(country_name);
CREATE INDEX idx_employment ON Employment(employee_id, country_id);


-- add row

INSERT INTO Department(id, department_name, phone_number) VALUES
(1, 'Marketing', '+1 123 456 7890'),
(2, 'Sales', '+1 123 456 7891'),
(3, 'Support', '+1 123 456 7892'),
(4, 'Engineering', '+1 123 456 7893'),
(5, 'Human Resources', '+1 123 456 7894'),
(6, 'Finance', '+1 123 456 7895'),
(7, 'Legal', '+1 123 456 7896'),
(8, 'Operations', '+1 123 456 7897'),
(9, 'IT', '+1 123 456 7898'),
(10, 'Product Management', '+1 123 456 7899'),
(11, 'Research and Development', '+1 123 456 7900');

INSERT INTO Employee(id, first_name, last_name, date_of_birth, department_id, job_title, phone_number, address) VALUES
(1, 'John', 'Doe', '1970-01-01', 1, 'Marketing Manager', '+1 123 456 7890', '123 Main Street'),
(2, 'Jane', 'Doe', '1980-01-01', 2, 'Sales Representative', '+1 123 456 7891', '124 Main Street'),
(3, 'Bob', 'Smith', '1985-01-01', 3, 'Support Technician', '+1 123 456 7892', '125 Main Street'),
(4, 'Alice', 'Smith', '1990-01-01', 4, 'Software Engineer', '+1 123 456 7893', '126 Main Street'),
(5, 'James', 'Johnson', '1995-01-01', 5, 'HR Coordinator', '+1 123 456 7894', '127 Main Street'),
(6, 'Emily', 'Johnson', '2000-01-01', 6, 'Accountant', '+1 123 456 7895', '128 Main Street'),
(7, 'William', 'Williams', '2005-01-01', 7, 'Lawyer', '+1 123 456 7896', '129 Main Street'),
(8, 'Ashley', 'Williams', '2010-01-01', 8, 'Operations Manager', '+1 123 456 7897', '130 Main Street'),
(9, 'Michael', 'Brown', '2015-01-01', 9, 'IT Manager', '+1 123 456 7898', '131 Main Street'),
(10, 'Samantha', 'Brown', '2020-01-01', 10, 'Product Manager', '+1 123 456 7899', '132 Main Street'),
(11, 'Christopher', 'Davis', '1975-01-01', 1, 'Marketing Coordinator', '+1 123 456 7890', '133 Main Street'),
(12, 'Elizabeth', 'Davis', '1982-01-01', 2, 'Sales Representative', '+1 123 456 7891', '134 Main Street'),
(13, 'Matthew', 'Miller', '1988-01-01', 3, 'Support Technician', '+1 123 456 7892', '135 Main Street'),
(14, 'Abigail', 'Miller', '1993-01-01', 4, 'Software Engineer', '+1 123 456 7893', '136 Main Street'),
(15, 'David', 'Moore', '1998-01-01', 5, 'HR Coordinator', '+1 123 456 7894', '137 Main Street'),
(16, 'Sophia', 'Moore', '2003-01-01', 6, 'Accountant', '+1 123 456 7895', '138 Main Street'),
(17, 'Richard', 'Taylor', '2008-01-01', 7, 'Lawyer', '+1 123 456 7896', '139 Main Street'),
(18, 'Isabella', 'Taylor', '2013-01-01', 8, 'Operations Manager', '+1 123 456 7897', '140 Main Street'),
(19, 'Joseph', 'Anderson', '2018-01-01', 9, 'IT Technician', '+1 123 456 7898', '141 Main Street'),
(20, 'Olivia', 'Anderson', '2023-01-01', 11, 'Research Scientist', '+1 123 456 7900', '142 Main Street');

INSERT INTO EmployeeWedding(id, employee_id, spouse_id, wedding_date) VALUES
(1, 1, 2, '2022-01-01'),
(2, 3, 4, '2022-02-01'),
(3, 5, 6, '2022-03-01');

INSERT INTO Skill(id, skill_name, description) VALUES
(1, 'Java', 'Programming language'),
(2, 'Python', 'Programming language'),
(3, 'C++', 'Programming language'),
(4, 'C#', 'Programming language'),
(5, 'PHP', 'Programming language'),
(6, 'JavaScript', 'Programming language'),
(7, 'Ruby', 'Programming language'),
(8, 'Swift', 'Programming language'),
(9, 'Objective-C', 'Programming language'),
(10, 'SQL', 'Programming language for managing databases'),
(11, 'Graphic design', 'Designing visual concepts using software'),
(12, 'Project management', 'Planning and organizing projects'),
(13, 'Public speaking', 'Speaking in front of an audience'),
(14, 'Writing', 'Communicating through written words'),
(15, 'Leadership', 'Managing and inspiring a team');


INSERT INTO Employee_Skill(id, employee_id, skill_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 2),
(5, 2, 4),
(6, 3, 3),
(7, 3, 5),
(8, 4, 1),
(9, 4, 4),
(10, 5, 2),
(11, 6, 3),
(12, 6, 5),
(13, 7, 2),
(14, 7, 4),
(15, 8, 1),
(16, 8, 4),
(17, 9, 2),
(18, 9, 5),
(19, 10, 3),
(20, 10, 1),
(21, 11, 3),
(22, 11, 5),
(23, 12, 2),
(24, 12, 4),
(25, 13, 1),
(26, 13, 4),
(27, 14, 2),
(28, 14, 5),
(29, 15, 3),
(30, 15, 1),
(31, 16, 3),
(32, 16, 5),
(33, 17, 2),
(34, 17, 4),
(35, 18, 1),
(36, 18, 4),
(37, 19, 2),
(38, 19, 5),
(39, 20, 3),
(40, 20, 1);

INSERT INTO Project(id, project_name, total_budget) VALUES
(1, 'Project 1', 10000),
(2, 'Project 2', 20000),
(3, 'Project 3', 30000),
(4, 'Project 4', 40000),
(5, 'Project 5', 50000),
(6, 'Project 6', 60000),
(7, 'Project 7', 70000),
(8, 'Project 8', 80000),
(9, 'Project 9', 90000),
(10, 'Project 10', 100000),
(11, 'Project 11', 110000),
(12, 'Project 12', 120000);


INSERT INTO Project_Skill(id, project_id, skill_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 1),
(8, 4, 4),
(9, 5, 2),
(10, 5, 5),
(11, 6, 3),
(12, 6, 5),
(13, 7, 2),
(14, 7, 4),
(15, 8, 1),
(16, 8, 4),
(17, 9, 2),
(18, 9, 5),
(19, 10, 3),
(20, 10, 1),
(21, 11, 3),
(22, 11, 5),
(23, 12, 2),
(24, 12, 4),
(25, 6, 1),
(26, 6, 4),
(27, 7, 2),
(28, 7, 5),
(29, 8, 3),
(30, 8, 1);


INSERT INTO Employee_Project(id, employee_id, project_id, role) VALUES
(1, 1, 1, 'Project Manager'),
(2, 1, 2, 'Project Manager'),
(3, 2, 3, 'Project Manager'),
(4, 2, 4, 'Project Manager'),
(5, 3, 5, 'Project Manager'),
(6, 3, 6, 'Project Manager'),
(7, 4, 7, 'Project Manager'),
(8, 4, 8, 'Project Manager'),
(9, 5, 9, 'Project Manager'),
(10, 5, 10, 'Project Manager'),
(11, 6, 1, 'Project Manager'),
(12, 6, 2, 'Project Manager'),
(13, 7, 3, 'Project Manager'),
(14, 7, 4, 'Project Manager'),
(15, 8, 5, 'Project Manager'),
(16, 8, 6, 'Project Manager'),
(17, 9, 7, 'Project Manager'),
(18, 9, 8, 'Project Manager'),
(19, 10, 9, 'Project Manager'),
(20, 10, 10, 'Project Manager'),
(21, 11, 1, 'Team Lead'),
(22, 11, 2, 'Team Lead'),
(23, 12, 3, 'Team Lead'),
(24, 12, 4, 'Team Lead'),
(25, 13, 5, 'Team Lead'),
(26, 13, 6, 'Team Lead'),
(27, 14, 7, 'Team Lead'),
(28, 14, 8, 'Team Lead'),
(29, 15, 9, 'Team Lead'),
(30, 15, 10, 'Team Lead'),
(31, 16, 1, 'Developer'),
(32, 16, 2, 'Developer'),
(33, 17, 3, 'Developer'),
(34, 17, 4, 'Developer'),
(35, 18, 5, 'Developer'),
(36, 18, 6, 'Developer'),
(37, 19, 7, 'Developer'),
(38, 19, 8, 'Developer'),
(39, 20, 9, 'Developer'),
(40, 20, 10, 'Developer');


INSERT INTO Equipment(id, equipment_name, department_id) VALUES
(1, 'Computer', 1),
(2, 'Printer', 1),
(3, 'Scanner', 1),
(4, 'Projector', 2),
(5, 'Whiteboard', 2),
(6, 'Laptop', 3),
(7, 'Desktop', 3),
(8, 'Monitor', 3),
(9, 'Tablet', 4),
(10, 'Smartphone', 4),
(11, 'Server', 5),
(12, 'Router', 5),
(13, 'Switch', 5),
(14, 'Firewall', 6),
(15, 'UPS', 6),
(16, 'PDU', 6),
(17, 'Surge protector', 7),
(18, 'Cable', 7),
(19, 'Keyboard', 8),
(20, 'Mouse', 8),
(21, 'Headphones', 9),
(22, 'Webcam', 9),
(23, 'Microphone', 10),
(24, 'Speakers', 10);

INSERT INTO Supplier(id, supplier_name, address, phone_number) VALUES
(1, 'Acme Corp', '123 Main Street, Anytown, USA', '+1 123 456 7890'),
(2, 'XYZ Inc', '456 Park Avenue, Anytown, USA', '+1 123 456 7891'),
(3, 'ABC Enterprises', '789 Market Street, Anytown, USA', '+1 123 456 7892'),
(4, 'Def Co', '321 Center Road, Anytown, USA', '+1 123 456 7893'),
(5, 'Ghi Inc', '654 Hillside Drive, Anytown, USA', '+1 123 456 7894');

INSERT INTO Equipment_Supplier(id, equipment_id, supplier_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 2),
(6, 6, 3),
(7, 7, 3),
(8, 8, 3),
(9, 9, 4),
(10, 10, 4),
(11, 11, 5),
(12, 12, 5),
(14, 14, 4),
(15, 15, 4),
(16, 16, 2),
(17, 17, 1),
(18, 18, 3),
(19, 19, 5),
(20, 20, 5),
(21, 21, 2),
(22, 22, 2),
(23, 23, 1),
(24, 24, 1);

INSERT INTO Country(id, country_name, population) VALUES
(1, 'Hà Nội', 7664000),
(2, 'Hồ Chí Minh', 8260000),
(3, 'Đà Nẵng', 1269000),
(4, 'Hải Phòng', 1939000),
(5, 'Cần Thơ', 1255000);

INSERT INTO Employment(id, employee_id, country_id, income, contract_start_date, contract_end_date) VALUES
(1, 1, 1, 50000, '2022-01-01', '2022-12-31'),
(2, 2, 2, 60000, '2022-01-01', '2022-12-31'),
(3, 3, 3, 70000, '2022-01-01', '2022-12-31'),
(4, 4, 4, 80000, '2022-01-01', '2022-12-31'),
(5, 5, 5, 90000, '2022-01-01', '2022-12-31'),
(6, 6, 1, 100000, '2022-01-01', '2022-12-31'),
(7, 7, 2, 110000, '2022-01-01', '2022-12-31'),
(8, 8, 3, 120000, '2022-01-01', '2022-12-31'),
(9, 9, 4, 130000, '2022-01-01', '2022-12-31'),
(10, 10, 1, 140000, '2022-01-01', '2022-12-31'),
(11, 11, 1, 150000, '2022-01-01', '2022-12-31'),
(12, 12, 2, 160000, '2022-01-01', '2022-12-31'),
(13, 13, 3, 170000, '2022-01-01', '2022-12-31'),
(14, 14, 4, 180000, '2022-01-01', '2022-12-31'),
(15, 15, 5, 190000, '2022-01-01', '2022-12-31'),
(16, 16, 1, 200000, '2022-01-01', '2022-12-31'),
(17, 17, 2, 210000, '2022-01-01', '2022-12-31'),
(18, 18, 3, 220000, '2022-01-01', '2022-12-31'),
(19, 19, 4, 230000, '2022-01-01', '2022-12-31'),
(20, 20, 5, 240000, '2022-01-01', '2022-12-31');

-- Get the names and phone numbers of all employees:
SELECT first_name, last_name, phone_number FROM Employee;

--  Get the names of all departments and the number of employees in each department:
SELECT d.department_name, COUNT(e.id) as employee_count
FROM Department d
JOIN Employee e ON d.id = e.department_id
GROUP BY d.department_name;

-- Get the names of all employees who have a specific skill:
SELECT e.first_name, e.last_name
FROM Employee e
JOIN Employee_Skill es ON e.id = es.employee_id
JOIN Skill s ON es.skill_id = s.id
WHERE s.skill_name = 'PHP';

-- Get the names and budgets of all projects that require a specific skill:
SELECT p.project_name, p.total_budget
FROM Project p
JOIN Project_Skill ps ON p.id = ps.project_id
JOIN Skill s ON ps.skill_id = s.id
WHERE s.skill_name = 'Java';

-- Get the names and addresses of all suppliers that provide equipment to a specific department:
SELECT s.supplier_name, s.address
FROM Supplier s
JOIN Equipment_Supplier es ON s.id = es.supplier_id
JOIN Equipment e ON es.equipment_id = e.id
JOIN Department d ON e.department_id = d.id
WHERE d.department_name = 'Engineering';

-- Get the names and wedding dates of all employees who are married to other employees:
SELECT CONCAT(e1.first_name," ", e1.last_name) as employee_name,
       CONCAT(e2.first_name," ", e2.last_name) as spouse_name,
       ew.wedding_date
FROM EmployeeWedding ew
JOIN Employee e1 ON ew.employee_id = e1.id
JOIN Employee e2 ON ew.spouse_id = e2.id;

-- Get the names and contract start and end dates of all employees who have worked in a specific country:
SELECT CONCAT(e.first_name," ", e.last_name) as employee_name,
       c.country_name,
       em.contract_start_date, em.contract_end_date
FROM Employment em
JOIN Employee e ON em.employee_id = e.id
JOIN Country c ON em.country_id = c.id
WHERE c.country_name = 'Đà Nẵng';

-- Get the names of all projects that have a budget greater than a certain amount and require a specific skill:
SELECT p.project_name
FROM Project p
JOIN Project_Skill ps ON p.id = ps.project_id
JOIN Skill s ON ps.skill_id = s.id
WHERE p.total_budget >= 100000 AND s.skill_name = 'Java';