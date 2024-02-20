-- Team Member: Shantel Parrish and Janett Morales

-- Query 4: Displays the store's zipcode and first letter of its state (using RPAD and SUBSTR)

SELECT RPAD(SUBSTR(b.title, 1, 10) || ' by ' || SUBSTR(a.authorfirstname, 1, 1) 
    || '. ' || a.authorlastname, 40, '.') || b.price AS "Book Pricing"
FROM book b JOIN author a ON b.authorid = a.authorid
ORDER BY b.price;

-- Query 5: Displays how many months since customer's last order (using MONTHS_BETWEEN and ROUND)

SELECT c.memberid AS "Member ID", c.firstname || ' ' || c.lastname AS 
    "Customer Name", MAX(o.orderdate) AS "Date of Last Order", 
    ROUND(MONTHS_BETWEEN(SYSDATE,MAX(o.orderdate))) AS "Months since Last Order"
FROM customer c JOIN bookorder o ON c.memberid = o.customermemberid
GROUP BY c.memberid, c.firstname, c.lastname
ORDER BY c.lastname, c.firstname;

