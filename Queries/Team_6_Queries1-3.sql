--Query 1--
/* Displays the name and price of the book. Where the price is less than $25 and it has a genreID of 200. 
It is ordered by the price in descending order. 
*/
SELECT title AS "Book Title", price AS "Book Price"
FROM book
WHERE price < 25 AND genreid = 200
ORDER BY price DESC;

--Query 2--
/*Displays member id, order id, and the purchase date. Prompts the user to enter a valid member id number and the order id number is like any 6000 number.
Ordered by the date the order was purchased.*/
SELECT customermemberid AS "Customer ID#", orderid AS "Order ID#", orderdate AS "Purchase Date"
FROM bookorder
WHERE customermemberid = &customerid AND orderid LIKE '600%'
ORDER BY orderdate;

--Query 3--
/*Displays the customer's first name and last name, as well as their member id. Lists the customers that have an id number between 1500 and 6000.
Orders the listed customers by their member id number, and fetches only the first 5 rows.*/
SELECT firstname || ' '|| lastname AS "Customer Name", memberid AS "Customer ID#"
FROM customer
WHERE memberid BETWEEN 1500 AND 6000
ORDER BY memberid
FETCH NEXT 5 ROWS ONLY;

