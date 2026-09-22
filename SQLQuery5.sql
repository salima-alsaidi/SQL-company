

CREATE TABLE Departments (
    DNUM INT PRIMARY KEY,
    DName VARCHAR(100) NOT NULL

);


CREATE TABLE Departments_Location (
    DNUM INT,
    Location VARCHAR(100),

    PRIMARY KEY (DNUM, Location),

    FOREIGN KEY (DNUM)
        REFERENCES Departments(DNUM),


);

CREATE TABLE Employees (
    SSN VARCHAR(20) PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    BirthDate DATE,
    Gender CHAR(1),
    DNUM INT NOT NULL,
    SupervisorSSN VARCHAR(20),

    FOREIGN KEY (DNUM)
        REFERENCES Departments(DNUM),

    FOREIGN KEY (SupervisorSSN)
        REFERENCES Employees(SSN)
);



CREATE TABLE Projects (
    PNumber INT PRIMARY KEY,
    PName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    City VARCHAR(100),

    DNUM INT NOT NULL,

    FOREIGN KEY (DNUM)
        REFERENCES Departments(DNUM)
);

CREATE TABLE Work_On (
    SSN VARCHAR(20),
    PNumber INT,
    Hours DECIMAL(5,2),

    PRIMARY KEY (SSN, PNumber),

    FOREIGN KEY (SSN)
        REFERENCES Employees(SSN),

    FOREIGN KEY (PNumber)
        REFERENCES Projects(PNumber)
);

DROP TABLE Work_On;

CREATE TABLE Dependents (
    SSN VARCHAR(20),
    DependentName VARCHAR(100),
    Gender CHAR(1),
    BirthDate DATE,

    PRIMARY KEY (SSN, DependentName),

    FOREIGN KEY (SSN)
        REFERENCES Employees(SSN)
        ON DELETE CASCADE
);
DROP TABLE Dependents;

CREATE TABLE Manage (
    DNUM INT PRIMARY KEY,
    SSN VARCHAR(20) NOT NULL,
    HiringDate DATE NOT NULL,

    FOREIGN KEY (DNUM)
        REFERENCES Departments(DNUM),

    FOREIGN KEY (SSN)
        REFERENCES Employees(SSN)
);

--INSERTING TABLES FOR COMPANY DEPARTMENT
INSERT INTO Departments (DNUM, DName) VALUES 
(1, 'RESEARCH'), 
(2, 'Administration'),
(3, 'IT'),
(4, 'Finance'),
(5, 'Human Resources');

SELECT*FROM Department


--INSERTING TABLES FOR COMPANY DEPARTMENT_LOCATION 
INSERT INTO Departments_Location(DNUM,Location)  VALUES
(1, 'Riyadh'),
(1, 'Jeddah'),
(2, 'Muscat'),
(3, 'Dubai'),
(3, 'Abu Dhabi'),
(4, 'Doha'),
(5, 'Manama');

SELECT*FROM Departments_Location;

----INSERTING TABLES FOR COMPANY Employees
INSERT INTO Employees(SSN, Fname, Lname, BirthDate, Gender, DNUM, SupervisorSSN) VALUES 
('1001', 'Ahmed', 'Ali', '1980-05-12', 'M', 1, '1001'),
('1002', 'Sara', 'Hassan', '1982-08-20', 'F', 2, '1002'),
('1003', 'Omar', 'Khalid', '1979-11-15', 'M', 3, '1003'),
('1004', 'Fatima', 'Salim', '1985-03-10', 'F', 4, '1004'),
('1005', 'Khalid', 'Saeed', '1981-07-25', 'M', 5, '1005');

SELECT*FROM Employees;


----INSERTING TABLES FOR COMPANY PROJECT
INSERT INTO Projects(PNumber, PName, Location, City, DNUM) VALUES 
(101, 'AI Research', 'Building A', 'Riyadh', 1),
(102, 'Database System', 'Building B', 'Jeddah', 1),
(103, 'Employee Portal', 'Main Office', 'Muscat', 2),
(104, 'Network Upgrade', 'IT Center', 'Dubai', 3),
(105, 'Mobile Application', 'IT Center', 'Abu Dhabi', 3),
(106, 'Financial Analysis', 'Finance Office', 'Doha', 4),
(107, 'Recruitment System', 'HR Office', 'Manama', 5);

SELECT * FROM Projects;

------INSERTING TABLES FOR COMPANY Work_On

INSERT INTO Work_On (SSN, PNumber, Hours) VALUES
('1001', 101, 20.00),
('1001', 102, 15.50),

('1002', 103, 30.00),

('1003', 104, 25.00),
('1003', 105, 20.50);

SELECT* FROM Work_On; 
SELECT SSN FROM Work_On;

------INSERTING TABLES FOR COMPANY Dependents
INSERT INTO Dependents(SSN, DependentName, Gender, BirthDate) VALUES
('1001', 'Yousef', 'M', '2010-03-15'),
('1001', 'Lina', 'F', '2013-07-20'),
('1002', 'Adam', 'M', '2012-05-10'),
('1002', 'Sara Jr', 'F', '2015-09-12');
SELECT * FROM Dependents;


------INSERTING TABLES FOR COMPANY manage 
INSERT INTO Manage (DNUM, SSN, HiringDate)
VALUES
(1, '1001', '2005-01-10'),
(2, '1002', '2007-03-15'),
(3, '1003', '2004-06-20'),
(4, '1004', '2010-09-01');

SELECT * FROM Manage;

