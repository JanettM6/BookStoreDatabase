--Janett Morales and Shantel Parrish --

--Query 6--
/*This query displays the date of book orders in a more readable format using to_char.
It also displays the member who placed the order, as well as, the number of books 
that were purchased in that order.*/
SELECT DISTINCT bo.orderid AS "Order ID", 
    TO_CHAR(bo.orderdate, 'MON DD, YYYY') AS "Order Date", 
    c.firstname || ' ' || c.lastname AS "Customer Name", 
    COUNT(ob.bookisbn) AS "Number of Books Purchased"
FROM bookorder bo
JOIN customer c on c.memberid = bo.customermemberid
JOIN order_book ob on ob.ordersorderid = bo.orderid
GROUP BY bo.orderid,
    TO_CHAR(bo.orderdate, 'MON DD, YYYY'), 
    c.firstname, 
    c.lastname
ORDER BY 2 DESC;


--Query 7--
/*This query displays the title and the price of the book. 
But it also displays the price range of the books as well. 
Then it gets ordered by the price of the book from 'cheapest' to the most expensive*/  
SELECT title AS "Book Title", price AS "Book Price",
(CASE WHEN price < 10 THEN 'Bargain Price'
      WHEN price > 10 AND price < 20 THEN 'Mid Range'
      WHEN price > 20 THEN 'Pricey'
      END) AS "Price Range"
FROM book
ORDER BY price;
