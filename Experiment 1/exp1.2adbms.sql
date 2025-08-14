CREATE TABLE Department
(
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);


CREATE TABLE Course
(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);



INSERT INTO Department (DeptID, DeptName) VALUES
    (1, 'Computer Science'),
    (2, 'Physics'),
    (3, 'Mathematics'),
    (4, 'Chemistry'),
    (5, 'Biology');


INSERT INTO Course VALUES
    (101, 'Data Structures', 1),
    (102, 'Operating Systems', 1),
    (103, 'Quantum Mechanics', 2),
    (104, 'Electromagnetism', 2),
    (105, 'Linear Algebra', 3),
    (106, 'Calculus', 3),
    (107, 'Organic Chemistry', 4),
    (108, 'Physical Chemistry', 4),
    (109, 'Genetics', 5),
    (110, 'Molecular Biology', 5);


SELECT DeptName
FROM Department
WHERE DeptID IN ( 
SELECT DeptID
FROM Course
GROUP BY DeptID
HAVING COUNT(*) > 2 
);


CREATE LOGIN Gautamcpp
WITH PASSWORD = 'Gautam1825'

CREATE USER Gautam 
FOR LOGIN Gautamcpp

EXECUTE AS USER = 'Gautam'
GRANT SELECT ON DEPARTMENT TO Gautam

REVOKE SELECT ON DEPARTMENT FROM Gautam 

 