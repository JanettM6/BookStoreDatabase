--Team 6: Shantel Parrish and Janett Morales

ALTER TABLE Book DROP CONSTRAINT Book_GenreID_fk;
ALTER TABLE Book DROP CONSTRAINT Book_AuthorID_fk;
ALTER TABLE Book DROP CONSTRAINT Book_StoreID_fk;
ALTER TABLE BookOrder DROP CONSTRAINT BookOrder_CustomerMemberID_fk;

DROP SEQUENCE genre_genreid_seq;
DROP TABLE BookStore;
DROP TABLE Genre;
DROP TABLE Author;
DROP TABLE Customer;
DROP TABLE Book;
DROP TABLE BookOrder;
DROP TABLE Order_Book;

-- Creating Bookstore table --
CREATE TABLE BookStore(
StoreID NUMBER(6),
Street VARCHAR2(30) NOT NULL,
City VARCHAR2(30) NOT NULL,
State VARCHAR2(2) NOT NULL,
ZipCode NUMBER(5) NOT NULL,
CONSTRAINT BookStore_StoreID_pk PRIMARY KEY (StoreID)
);

-- Creating Genre table --
CREATE TABLE Genre(
GenreID NUMBER(4),
GenreName VARCHAR2(20) NOT NULL,
CONSTRAINT Genre_GenreID_pk PRIMARY KEY (GenreID)
);

--Creating Author table --
CREATE TABLE Author(
AuthorID NUMBER(6),
AuthorFirstName VARCHAR2(25) NOT NULL, 
AuthorLastName VARCHAR2(25) NOT NULL,
CONSTRAINT Author_AuthorID_pk PRIMARY KEY (AuthorID)
);

--Creating Customer table --
CREATE TABLE Customer(
MemberID NUMBER(6),
FirstName varchar(25) NOT NULL,
LastName varchar(25) NOT NULL,
PhoneNumber NUMBER(10),
Email VARCHAR2(50),
CONSTRAINT Customer_MemberID_pk PRIMARY KEY (MemberID)
);

--Creating Book table --
CREATE TABLE Book(
ISBN NUMBER(13),
Title VARCHAR2(100) NOT NULL, 
Price DECIMAL(6,2) NOT NULL, 
GenreID NUMBER(4),
AuthorID NUMBER(6), 
StoreID NUMBER(6),
CONSTRAINT Book_ISBN_pk PRIMARY KEY (ISBN),
CONSTRAINT Book_GenreID_fk FOREIGN KEY (GenreID) REFERENCES Genre,
CONSTRAINT Book_AuthorID_fk FOREIGN KEY (AuthorID) REFERENCES Author,
CONSTRAINT Book_StoreID_fk FOREIGN KEY (StoreID) REFERENCES BookStore
);

--Creating BookOrder table --
CREATE TABLE BookOrder(
OrderID NUMBER(6),
OrderDate date,
CustomerMemberID NUMBER(6),
CONSTRAINT BookOrder_OrderID_pk PRIMARY KEY (OrderID),
CONSTRAINT BookOrder_CustomerMemberID_fk FOREIGN KEY (CustomerMemberID)
REFERENCES Customer
);

--Creating Order_Book table --
CREATE TABLE Order_Book(
OrdersOrderID NUMBER(6),
BookISBN NUMBER(13),
CONSTRAINT Order_Book_OrdersOrderID_BookISBN_pk PRIMARY KEY
(OrdersOrderID, BookISBN)
);

-- Create Primary Key Values for Customer --
CREATE SEQUENCE genre_genreid_seq
INCREMENT BY 1
START WITH 200;

-- Adding Bookstore data --
INSERT INTO Bookstore VALUES (101, '123 Main Street','New York', 'NY', 10001 );
INSERT INTO Bookstore VALUES (102, '456 Elm Street', 'Los Angeles', 'CA', 90001);
INSERT INTO Bookstore VALUES (103, '789 Oak Street', 'Chicago', 'IL', 60601);
INSERT INTO Bookstore VALUES (104, '321 Maple Avenue', 'Houston', 'TX', 77001);
INSERT INTO Bookstore VALUES (105, '567 Pine Road', 'Miami', 'FL', 33101);
INSERT INTO Bookstore VALUES (106, '890 Cedar Lane', 'San Francisco', 'CA', 94101);
INSERT INTO Bookstore VALUES (107, '234 Birch Boulevard', 'Boston', 'MA', 21010);
INSERT INTO Bookstore VALUES (108, '678 Willow Drive', 'Seattle', 'WA', 98101);
INSERT INTO Bookstore VALUES (109, '901 Spruce Court', 'Denver', 'CO', 80201);
INSERT INTO Bookstore VALUES (110, '543 Fir Avenue', 'Austin', 'TX', 73301);


-- Adding Genre data --
INSERT INTO Genre VALUES (genre_genreid_seq.NEXTVAL, 'Fantasy');
INSERT INTO Genre VALUES (genre_genreid_seq.NEXTVAL, 'Romance');
INSERT INTO Genre VALUES (genre_genreid_seq.NEXTVAL, 'Fiction');
INSERT INTO Genre VALUES (genre_genreid_seq.NEXTVAL, 'Nonfiction');
INSERT INTO Genre VALUES (genre_genreid_seq.NEXTVAL, 'Thriller');
INSERT INTO Genre VALUES (genre_genreid_seq.NEXTVAL, 'Historical Fiction');
INSERT INTO Genre VALUES (genre_genreid_seq.NEXTVAL, 'Mystery and Crime');
INSERT INTO Genre VALUES (genre_genreid_seq.NEXTVAL, 'Horror');
INSERT INTO Genre VALUES (genre_genreid_seq.NEXTVAL, 'Manga');
INSERT INTO Genre VALUES (genre_genreid_seq.NEXTVAL, 'Poetry');

-- Adding Author data --
INSERT INTO Author VALUES (1001, 'Sarah', 'Maas');
INSERT INTO Author VALUES (1002, 'Lemony', 'Snicket');
INSERT INTO Author VALUES (1003, 'Victoria', 'Shwab');
INSERT INTO Author VALUES (1004, 'Rebecca', 'Yarros');
INSERT INTO Author VALUES (1005, 'Madeline', 'Miller');
INSERT INTO Author VALUES (1006, 'Rebecca', 'Ross');
INSERT INTO Author VALUES (1007, 'Maggie', 'Ofarrell');
INSERT INTO Author VALUES (1008, 'Delia', 'Owens');
INSERT INTO Author VALUES (1009, 'Isabel', 'Canas');
INSERT INTO Author VALUES (1010, 'Richard', 'Osman');
INSERT INTO Author VALUES (1011, 'Michelle', 'Zauner');
INSERT INTO Author VALUES (1012, 'Riley', 'Sager');
INSERT INTO Author VALUES (1013, 'Tatsuya', 'Endo');
INSERT INTO Author VALUES (1014, 'Rupi', 'Kaur');

-- Adding Customer data --
INSERT INTO Customer VALUES (1849, 'Charlie', 'Kelly', 7705700066, 'ckelly@gmail.com');
INSERT INTO Customer VALUES (4239, 'Dennis', 'Reynolds', 7705794550, 'dennis.reynolds@hotmail.com');
INSERT INTO Customer VALUES (8694,'Deandra', 'Reynolds', 7703701564, 'd_reynolds24@gmail.com');
INSERT INTO Customer VALUES (7358, 'Frank', 'Reynolds', 4044727707, 'frankie_reynolds@gmail.com');
INSERT INTO Customer VALUES (5492, 'Dwight', 'Schrute', 6788776322, 'schrutefarms@gmail.com');
INSERT INTO Customer VALUES (2049, 'Kelly', 'Kappor', 6781561186, 'kellyxoxo@hotmail.com');
INSERT INTO Customer VALUES (5830, 'Pam', 'Beesly', 4040573135, 'beesly_pam@dundermifflin.com');
INSERT INTO Customer VALUES (5939, 'Jim', 'Halpert', 4048884268, 'bigtuna10@hotmail.com');
INSERT INTO Customer VALUES (9582, 'Michael', 'Scott', 6784912126, 'prisonmike@att.net');
INSERT INTO Customer VALUES (9284, 'Angela', 'Martin', 7701750879, 'angelaschrute@gmail.com');

-- Adding Book table --
INSERT INTO Book VALUES (9781635575569, 'A Court of Thorns and Roses', 19.00, 200, 1001, 101);
INSERT INTO Book VALUES (9780062060624, 'Song of Achilles', 17.99, 205, 1005, 106);
INSERT INTO Book VALUES (9781324090625, 'Poison for Breakfast', 17.95, 206, 1002, 105);
INSERT INTO Book VALUES (9780062835789, 'Gallant', 15.99, 200, 1003, 102);
INSERT INTO Book VALUES (9781984880987, 'The Thursday Murder Club', 18.00, 206, 1010, 107);
INSERT INTO Book VALUES (9780593315088, 'The Marriage Portrait', 17.00, 205, 1007, 108);
INSERT INTO Book VALUES (9780735219106, 'Where the Crawdads Sing', 18.00, 202, 1008, 101);
INSERT INTO Book VALUES (9781649374042, 'Fourth Wing', 26.99, 200, 1004, 102);
INSERT INTO Book VALUES (9781250857439, 'Divine Rivals', 18.99, 201, 1006, 105);
INSERT INTO Book VALUES (9780593436721, 'Vampires of El Norte', 28, 207, 1009, 109);
INSERT INTO Book VALUES (9781984898951, 'Crying in H Mart', 17, 203, 1011, 103);
INSERT INTO Book VALUES (9780593183229, 'The Only One Left', 28, 204, 1012, 104);
INSERT INTO Book VALUES (9781974715466, 'Spy x Family', 9.99, 208, 1013, 109);
INSERT INTO Book VALUES (9781449474256, 'Milk and Honey', 14.99, 209, 1014, 104);

-- Adding BookOrder table --
INSERT INTO BookOrder VALUES (6001, TO_DATE('2022-09-06', 'YYYY-MM-DD'), 2049);
INSERT INTO BookOrder VALUES (6002, TO_DATE('2022-09-10', 'YYYY-MM-DD'), 5830);
INSERT INTO BookOrder VALUES (6003, TO_DATE('2022-10-01', 'YYYY-MM-DD'), 9582);
INSERT INTO BookOrder VALUES (6004, TO_DATE('2022-10-02', 'YYYY-MM-DD'), 2049);
INSERT INTO BookOrder VALUES (6005, TO_DATE('2022-10-02', 'YYYY-MM-DD'), 9582);
INSERT INTO BookOrder VALUES (6006, TO_DATE('2022-12-01', 'YYYY-MM-DD'), 9284);
INSERT INTO BookOrder VALUES (6007, TO_DATE('2022-12-02', 'YYYY-MM-DD'), 1849);
INSERT INTO BookOrder VALUES (6008, TO_DATE('2022-12-02', 'YYYY-MM-DD'), 7358);
INSERT INTO BookOrder VALUES (6009, TO_DATE('2022-12-02', 'YYYY-MM-DD'), 5830);
INSERT INTO BookOrder VALUES (6010, TO_DATE('2022-12-25', 'YYYY-MM-DD'), 5492);

-- Adding Order_Book table --
INSERT INTO Order_Book VALUES (6001, 9781649374042);
INSERT INTO Order_Book VALUES (6001, 9780062060624);
INSERT INTO Order_Book VALUES (6001, 9780593183229);
INSERT INTO Order_Book VALUES (6002, 9781324090625);
INSERT INTO Order_Book VALUES (6003, 9781635575569);
INSERT INTO Order_Book VALUES (6003, 9781250857439);
INSERT INTO Order_Book VALUES (6004, 9780593436721);
INSERT INTO Order_Book VALUES (6004, 9781984898951);
INSERT INTO Order_Book VALUES (6004, 9781984880987);
INSERT INTO Order_Book VALUES (6005, 9781635575569);
INSERT INTO Order_Book VALUES (6005, 9780735219106);
INSERT INTO Order_Book VALUES (6006, 9781649374042);
INSERT INTO Order_Book VALUES (6007, 9781984898951);
INSERT INTO Order_Book VALUES (6007, 9780735219106);
INSERT INTO Order_Book VALUES (6008, 9780062835789);
INSERT INTO Order_Book VALUES (6008, 9780593183229);
INSERT INTO Order_Book VALUES (6008, 9781649374042);
INSERT INTO Order_Book VALUES (6009, 9781324090625);
INSERT INTO Order_Book VALUES (6010, 9781635575569);
INSERT INTO Order_Book VALUES (6010, 9781649374042);

COMMIT;