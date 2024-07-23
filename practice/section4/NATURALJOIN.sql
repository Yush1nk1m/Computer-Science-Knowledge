use cspractice;

-- Customer 테이블 생성
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(100)
);

-- Order 테이블 생성
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

-- 데이터 삽입
INSERT INTO Customer (CustomerID, Name, City) VALUES
(1, "Yushin", "Gunpo"),
(2, "Yeonwoo", "Yongin"),
(3, "Choco", "DogCity");

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(3, 1, "2024-07-23"),
(2, 2, "2024-07-22"),
(1, 3, "2024-07-21");

SELECT C.Name, O.OrderDate
FROM Customer as C
NATURAL JOIN Orders as O;