CREATE INDEX idx ON tbl (col);
CREATE UNIQUE INDEX idx ON tbl (col);
CREATE FULLTEXT INDEX idx ON tbl (col);
CREATE SPATIAL INDEX idx ON tbl (col);
CREATE INDEX idx USING BTREE ON tbl (col);
CREATE INDEX idx USING HASH ON tbl (col);
CREATE INDEX idx ON tbl (col ASC);
CREATE INDEX idx ON tbl (col DESC);
CREATE INDEX part_of_name ON customer (name(10));
CREATE INDEX idx ON tbl (col) ALGORITHM DEFAULT;
CREATE INDEX idx ON tbl (col) ALGORITHM NOCOPY;
CREATE INDEX idx ON tbl (col) ALGORITHM INSTANT;
CREATE INDEX idx ON tbl (col) LOCK DEFAULT;
CREATE INDEX idx ON tbl ((col1 + col2), (col1 - col2), col1);
