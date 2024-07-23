use cspractice;

-- 테이블 생성
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position ENUM("Software engineer", "Product manager", "Designer"),
    skills SET("Java", "Python", "SQL", "Design", "Management"),
    salary DECIMAL(10, 2)
);

-- 데이터 삽입: Create
INSERT INTO employees (name, position, skills, salary) VALUES
("John Doe", "Software engineer", "Java,Python", 60000.00),
("Jane Smith", "Product manager", "SQL,Management", 75000.00),
("Emily Davis", "Designer", "Design", 70000.00);

-- 데이터 조회: Read
SELECT * FROM employees;

-- 데이터 조건 조회: Read
SELECT * FROM employees WHERE position = "Software engineer";
SELECT * FROM employees WHERE FIND_IN_SET("Java", skills);

-- 데이터 업데이트: Update
UPDATE employees SET salary = 80000.00 WHERE name = "John Doe";

-- 데이터 삭제: Delete
DELETE FROM employees WHERE name = "Emily Davis";

-- 테이블 삭제: Delete
DROP TABLE employees;