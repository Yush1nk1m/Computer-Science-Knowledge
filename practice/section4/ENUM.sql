use cspractice;
CREATE TABLE shirts(
    id      INT NOT NULL AUTO_INCREMENT,
    color   ENUM("red", "green", "blue") NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO shirts (color) VALUES ("red"), ("blue"), ("green");
SELECT * FROM shirts;