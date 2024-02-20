--Janett Morales and Shantel Parrish--

--Query 1--
--The query displays the title, book isbn, and author id to show the books basic information 
-- The subquery uses the genreid to search for book titles with the same title as Fourth wing
-- The books with the same genreid will be returned, and their basic information from the main 
-- will be displayed 
SELECT title AS "Title", isbn AS "Book isbn", authorid AS "Author ID", genreid AS "Genre ID"
FROM book
WHERE genreid =
    (SELECT genreid
     FROM book 
    WHERE title = 'Fourth Wing')
ORDER BY title;


--Query 2--
--The query displays the price, title, and genreid
-- returns the select statement if the price is less than any book 
-- that has less than any of the values returned in the where statement 
-- The where statement checks for author id's that are less than 1003

SELECT TO_CHAR(price, '$99.00') AS "Price", title AS "Title", genreid AS "GenreID"
FROM book
WHERE price < 
ANY(SELECT price
FROM book
WHERE authorid < 1003)
ORDER BY price DESC;
