use cspractice;

CREATE TABLE client (
    id          INT             AUTO_INCREMENT          PRIMARY KEY,
    name        VARCHAR(100),
    contact     INT
);

CREATE TABLE product (
    id          INT             AUTO_INCREMENT          PRIMARY KEY,
    user_id     INT,
    name        VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES client(id)
);

INSERT INTO client(name, contact) VALUES ("Alice", 12345678), ("Bob", 87654321);

INSERT INTO product(user_id, name) VALUES (1, "Laptop"), (2, "Smartphone");

SELECT client.name AS ClientName, client.contact AS ClientContact, product.name AS ProductName
FROM product INNER JOIN client ON product.user_id = client.id;