--Janett Morales and Shantel Parrish--

--Query 8--
/* This query displays the Author id, as well as the average price of their books.
The price is averaged out and formatted to output currency.
Then it is grouped by the author's id, and ordered by author id */
SELECT authorid AS "Author ID",
    TO_CHAR(AVG(price), '$999,999.99') AS "Price Average"
FROM book
GROUP BY authorid
ORDER BY authorid;

--Query 9--
/* The query displays order information for the oldest member that placed an order
that day. However, the order id has to be greater than 6005.
It is grouped by the orderid, orderdate, first and last name, and ordered by the order id */
SELECT bo.orderid AS "Order ID",
    MIN(c.memberid) || ': ' || c.firstname || ' ' || c.lastname AS "Oldest Member ID and Name",
    TO_CHAR(bo.orderdate, 'fmDay, "the" ddth "of" Month, YYYY') AS "Day of Order"
FROM bookorder bo
JOIN customer c on c.memberid = bo.customermemberid
GROUP BY bo.orderid, bo.orderdate, c.firstname, c.lastname
HAVING bo.orderid >= 6005
ORDER BY orderid;