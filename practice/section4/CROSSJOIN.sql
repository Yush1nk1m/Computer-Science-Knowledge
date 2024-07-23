use cspractice;

-- Product 테이블 생성
CREATE TABLE Product (
    ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Color 테이블 생성
CREATE TABLE Color (
    ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- 데이터 삽입
INSERT INTO Product (ID, Name) VALUES
(1, "Car"),
(2, "Laptop"),
(3, "Bomb"),
(4, "Key");

INSERT INTO Color (ID, Name) VALUES
(1, "Red"),
(2, "Green"),
(3, "Blue"),
(4, "Violet");

-- 교차 조인을 통한 모든 상품의 색상 조합 조회
SELECT P.Name, C.Name
FROM Product AS P
CROSS JOIN Color AS C;

