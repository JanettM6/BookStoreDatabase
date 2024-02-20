--Janett Morales and Shantel Parrish--

--View 1--
CREATE OR REPLACE VIEW book_store_view AS
SELECT *
FROM bookstore
WHERE state IN (SELECT state
FROM bookstore
WHERE state LIKE 'CA') ;

--View 2--

--Index--
CREATE INDEX book_title_idx
ON book(title);

--Flashback--
CREATE TABLE TEMP_SP(
Book_rating DECIMAL(2,1) NOT NULL);

INSERT INTO TEMP_SP VALUES(4.5);

SELECT *
FROM temp_sp;

DROP TABLE temp_sp;

SELECT *
FROM temp_sp;

FLASHBACK TABLE temp_sp TO BEFORE DROP;

SELECT *
FROM temp_sp;
