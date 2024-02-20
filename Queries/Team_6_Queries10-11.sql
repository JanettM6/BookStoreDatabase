-- Shantel Parrish and Janett Morales

-- Query 10: 
/* This query displays members and the author of their purchased books
(preferred authors). 5 tables were joined using (INNER) JOIN. Distinct authors
were listed using LISTAGG. The query is grouped and ordered by member's first and last name*/

SELECT member.firstname || ' ' || member.lastname AS "Member Name",
    LISTAGG(DISTINCT author.authorfirstname || ' ' || author.authorlastname, ', ') AS
        "Preferred Authors"
FROM customer member
INNER JOIN bookorder bo
ON member.memberid = bo.customermemberid
INNER JOIN order_book ob
ON ob.ordersorderid = bo.orderid
INNER JOIN book b
ON b.isbn = ob.bookisbn
INNER JOIN author
ON author.authorid = b.authorid
GROUP BY member.firstname, member.lastname
ORDER BY 1;

-- Query 11:
/* This query uses LEFT OUTER JOIN to display all members (including orphans)
and their most recent order date. If there is no match, then it will display
as 'Member has not placed any orders!' */

SELECT m.firstname || ' ' || m.lastname || ': ' || m.memberid AS "Member Name and ID",
    (CASE
        WHEN MAX(bo.orderid) IS NULL THEN 'Member has not placed any orders!'
        ELSE 'Order was placed on ' || TO_CHAR(MAX(bo.orderdate), 'MM/DD/YYYY')
    END) AS "Most Recent Order"
FROM customer m
LEFT OUTER JOIN bookorder bo 
ON m.memberid = bo.customermemberid
GROUP BY m.firstname, m.lastname, m.memberid
ORDER BY m.memberid;
