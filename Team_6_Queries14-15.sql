--Janett Morales and Shantel Parrish--

--The first SELECT statement displays the first and last name of the author, their authorid, 
--and their role (author) from the author table
-- The second SELECT statement displays the first and last name of the customers, their memberid,
-- and their role (customer) coming from the customer table
-- This query is put together with the UNION operator, which will print out the 
--selected informtion from both tables
-- The data is ordered by the First and last name of the customer and author
--Query 14--
SELECT authorfirstname || ' ' || authorlastname AS "Full name", 
'Author' AS "Role", authorid AS "ID Number"
FROM author
UNION 
SELECT firstname || ' '|| lastname AS "Full name", 'Customer',memberid
FROM customer
ORDER BY 1;



--The first SELECT statement uses the member id from the customer table
-- The second SELECT statement uses the member id from the bookorder table 
-- The query uses the intersect operator to see which member id's are common in both tables
-- The data is ordered by the member id, and it shows which member id placed an order 
--Query 15--
SELECT memberid AS "ID Number"
FROM customer
INTERSECT
SELECT customermemberid
FROM bookorder
ORDER BY 1;