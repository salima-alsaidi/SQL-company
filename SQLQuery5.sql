CREATE TABLE Department (
    DNUM INT PRIMARY KEY,
    DName VARCHAR(100) NOT NULL
);

CREATE TABLE Department_Location (
    DNUM INT,
    Location VARCHAR(100),

    PRIMARY KEY (DNUM, Location),

    FOREIGN KEY (DNUM)
        REFERENCES Department(DNUM),

);

CREATE TABLE Employee (
    SSN VARCHAR(20) PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    BirthDate DATE,
    Gender CHAR(1),

    DNUM INT NOT NULL,

    SupervisorSSN VARCHAR(20) NOT NULL,

    FOREIGN KEY (DNUM)
        REFERENCES Department(DNUM),

    FOREIGN KEY (SupervisorSSN)
        REFERENCES Employee(SSN)
);


CREATE TABLE Project (
    PNumber INT PRIMARY KEY,
    PName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    City VARCHAR(100),

    DNUM INT NOT NULL,

    FOREIGN KEY (DNUM)
        REFERENCES Department(DNUM)
);

CREATE TABLE Works_On (
    SSN VARCHAR(20),
    PNumber INT,
    Hours DECIMAL(5,2),

    PRIMARY KEY (SSN, PNumber),

    FOREIGN KEY (SSN)
        REFERENCES Employee(SSN),

    FOREIGN KEY (PNumber)
        REFERENCES Project(PNumber)
);

CREATE TABLE Dependent (
    SSN VARCHAR(20),
    DependentName VARCHAR(100),
    Gender CHAR(1),
    BirthDate DATE,

    PRIMARY KEY (SSN, DependentName),

    FOREIGN KEY (SSN)
        REFERENCES Employee(SSN)
        ON DELETE CASCADE
);

CREATE TABLE Manages (
    DNUM INT PRIMARY KEY,
    SSN VARCHAR(20) NOT NULL,
    HiringDate DATE NOT NULL,

    FOREIGN KEY (DNUM)
        REFERENCES Department(DNUM),

    FOREIGN KEY (SSN)
        REFERENCES Employee(SSN)
);



