-- Create table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT NULL
);

-- Add foreign key constraint
ALTER TABLE Employee
ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmpID);

-- Insert data
INSERT INTO Employee (EmpID, EmpName, Department, ManagerID)
VALUES
    (1, 'Alice', 'HR', NULL),
    (2, 'Bob', 'Finance', 1),
    (3, 'Charlie', 'IT', 1),
    (4, 'David', 'Finance', 2),
    (5, 'Eve', 'IT', 3),
    (6, 'Frank', 'HR', 1);

-- Select employees with their managers
SELECT 
    A.EmpName AS [Employee Name], 
    A.Department AS [Department], 
    B.EmpName AS [Manager Name], 
    B.Department AS [Manager Department]
FROM Employee AS A
LEFT OUTER JOIN Employee AS B
    ON A.ManagerID = B.EmpID;


    -- HEADING: FINANCIAL FORECAST MATCHING WITH FALLBACK STRATEGY (HARD)
-- TBL1 = YEAR_TBL: ID, YEAR, NPV
-- TBL2 = QUERY TBL: ID, YEAR
-- IF ANY NPV VALUE IS MISSING IN YEAR TBL MAKE IT 0.

-- FIND THE NPV OF EACH QUERY 

CREATE TABLE TBL_YEAR(
    ID INT,
    YEAR INT,
    NPV INT
);

CREATE TABLE TBL_QUERY(
    ID INT,
    YEAR INT
);

INSERT INTO TBL_YEAR
VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 9);


INSERT INTO TBL_QUERY
VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);


SELECT B.ID, B.YEAR, ISNULL(A.NPV, 0) AS [NPV]
FROM TBL_YEAR AS A RIGHT JOIN TBL_QUERY AS B
ON A.ID = B.ID AND A.YEAR = B.YEAR;
