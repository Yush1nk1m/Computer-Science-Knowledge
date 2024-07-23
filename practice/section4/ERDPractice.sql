-- 영업사원 테이블
CREATE TABLE Salesperson (
    SalespersonID INT PRIMARY KEY,
    Name VARCHAR(100),
    Contact VARCHAR(100)
);

-- 고객 테이블
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    Contact VARCHAR(100),
    SalespersonID INT,
    FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID)
);

-- 주문 테이블
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    ShippingAddress VARCHAR(200),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- 상품 테이블
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- 주문 세부 정보 테이블(주문과 상품 간의 다대다 관계 연결)
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    PRIMARY KEY (OrderID, ProductID)
);