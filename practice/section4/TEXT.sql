CREATE TABLE board(
    id      INT NOT NULL AUTO_INCREMENT,
    title   VARCHAR(255),
    content TEXT,
    PRIMARY KEY (id)
);

CREATE INDEX idx_content ON board (content(20));