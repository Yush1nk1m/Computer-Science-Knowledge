use cspractice;
CREATE TABLE socks(
    id      INT NOT NULL AUTO_INCREMENT,
    colors  SET("red", "green", "blue") NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO socks (colors) VALUES ("red"), ("red,green"), ("green,blue"), ("red,green,blue");
SELECT * FROM socks;