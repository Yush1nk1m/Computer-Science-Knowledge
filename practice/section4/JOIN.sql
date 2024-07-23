use cspractice;

-- Employees 테이블 생성
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT
);

-- Department 테이블 생성
CREATE TABLE Department (
    ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Employees 테이블에 데이터 삽입
INSERT INTO Employees (ID, Name, DepartmentID) VALUES
(1, "Yushin", 101),
(2, "Yeonwoo", 102),
(3, "Choco", 103),
(4, "Rmale", 404),
(5, "Abandoned Baby", 105);

-- Department 테이블에 데이터 삽입
INSERT INTO Department (ID, Name) VALUES
(101, "Ricci science"),
(102, "Dasan"),
(103, "Pet center"),
(404, "Legend smell hole"),
(500, "Server error hole");

-- INNER JOIN
SELECT E.Name, D.Name
FROM Employees AS E
INNER JOIN Department AS D ON E.DepartmentID = D.ID;

-- LEFT JOIN
SELECT E.Name, D.Name
FROM Employees AS E
LEFT JOIN Department AS D ON E.DepartmentID = D.ID;

-- RIGHT JOIN
SELECT E.Name, D.Name
FROM Employees AS E
RIGHT JOIN Department AS D ON E.DepartmentID = D.ID;

-- MySQL은 Full Outer Join 지원이 안 되기 때문에 UNION을 써야 한다.
SELECT E.Name, D.Name
FROM Employees AS E
LEFT JOIN Department AS D ON E.DepartmentID = D.ID

UNION

SELECT E.Name, D.Name
FROM Employees AS E
RIGHT JOIN Department AS D ON E.DepartmentID = D.ID;