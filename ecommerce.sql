/*
The question:

You are required to create tables for 
supplier,customer,category,product,productDetails,order,rating to store the data for 
the E-commerce with the schema definition given below.
Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
Customer(CUS__ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)
Category(CAT_ID,CAT_NAME)
Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)
Order(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)
Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)
*/

-- creation of database ecommerce
create database ecommerce;
use ecommerce;

create table supplier( SUPP_ID int auto_increment primary key, SUPP_NAME varchar(20) not null,
 SUPP_CITY varchar(20) not null, SUPP_PHONE int8 not null);
insert into supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) values("Rajesh Retails", "Delhi", 1234567890);
insert into supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) values("Appario Ltd.", "Mumbai", 2589631470);
insert into supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) values("Knome products", "Banglore", 9785462315);
insert into supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) values("Bansal Retails", "Kochi", 8975463285);
insert into supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) values("Mittal Ltd.", "Lucknow", 7898456532);

select * from supplier;

 create table Customer(CUS_ID INT PRIMARY KEY auto_increment,CUS_NAME varchar(20) not null, CUS_PHONE int8 not null, 
 CUS_CITY varchar(15) not null, CUS_GENDER CHAR(1) NOT NULL);

 INSERT INTO CUSTOMER(CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES("AAKASH", 999999999, "DELHI", "M");
 INSERT INTO CUSTOMER(CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES("AMAN", 9785463215,"NOIDA", "M");
 INSERT INTO CUSTOMER(CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES("NEHA", 9999999999, "MUMBAI", "F");
 INSERT INTO CUSTOMER(CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES("MEGHA",9994562399, "KOLKATA", "F");
 INSERT INTO CUSTOMER(CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES("PULKIT", 7895999999, "LUCKNOW", "M");

 SELECT * FROM CUSTOMER;

 CREATE TABLE CATEGORY(CAT_ID INT auto_increment PRIMARY KEY, CAT_NAME VARCHAR(15));
 INSERT INTO CATEGORY(CAT_NAME) VALUES("BOOKS");
 INSERT INTO CATEGORY(CAT_NAME) VALUES("GAMES");
 INSERT INTO CATEGORY(CAT_NAME) VALUES("GROCERIES");
 INSERT INTO CATEGORY(CAT_NAME) VALUES("ELECTRONICS");
 INSERT INTO CATEGORY(CAT_NAME) VALUES("CLOTHES");
 SELECT * FROM CATEGORY;

 CREATE TABLE PRODUCT 
 (PRO_ID INT auto_increment primary key, PRO_NAME VARCHAR(15) NOT NULL,
 PRO_DESC VARCHAR(25) NOT NULL, CAT_ID INT,
 FOREIGN KEY(CAT_ID ) REFERENCES CATEGORY(CAT_ID));
 

 INSERT INTO PRODUCT(PRO_NAME, PRO_DESC, CAT_ID) VALUES("GTA V", "ACTION ADV GAME", 2);
 INSERT INTO PRODUCT(PRO_NAME, PRO_DESC, CAT_ID) VALUES("T SHIRT", " INFORMAL WEAR", 5);
 INSERT INTO PRODUCT(PRO_NAME, PRO_DESC, CAT_ID) VALUES("ROG LAPTOP", "PORTABLE COMPUTER", 4);
 INSERT INTO PRODUCT(PRO_NAME, PRO_DESC, CAT_ID) VALUES("OATS", "HEALTHY FOOD", 3);
 INSERT INTO PRODUCT(PRO_NAME, PRO_DESC, CAT_ID) VALUES("HARRY POTTER " , "FAMOUS CHILDRENS BOOK", 1);
 SELECT * FROM PRODUCT;

-- creating table ProductDetails

 CREATE TABLE ProductDetails(PROD_ID INT primary key auto_increment, PRO_ID INT NOT NULL,
 SUPP_ID INT NOT NULL, PRICE INT NOT NULL,
 FOREIGN KEY (PRO_ID) REFERENCES PRODUCT(PRO_ID),
 FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID));

-- inserting records into product details table

 INSERT INTO ProductDetails(PRO_ID, SUPP_ID, PRICE) VALUES( 1, 2, 1500);
 INSERT INTO ProductDetails(PRO_ID, SUPP_ID, PRICE) VALUES(3,5, 30000);
 INSERT INTO ProductDetails(PRO_ID, SUPP_ID, PRICE) VALUES(5,1,3000);
 INSERT INTO ProductDetails(PRO_ID, SUPP_ID, PRICE) VALUES(2,3 , 2500);
 INSERT INTO ProductDetails(PRO_ID, SUPP_ID, PRICE) VALUES(4,1, 1000);
 SELECT * FROM ProductDetails;

-- creating table orders

 CREATE TABLE ORDERS(ORD_ID INT PRIMARY KEY, ORD_AMOUNT INT NOT NULL, 
 ORD_DATE DATE, CUS_ID INT NOT NULL, PROD_ID INT NOT NULL,
 FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
 FOREIGN KEY (PROD_ID) REFERENCES ProductDetails(PROD_ID));

-- inserting records into orders table

 INSERT INTO Orders(ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PROD_ID)
 VALUES (20, 1500, "2021-10-12", 3, 5);
  INSERT INTO Orders(ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PROD_ID)
 VALUES( 25, 30500, '2021-09-16', 5,2);
  INSERT INTO Orders(ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PROD_ID)
 VALUES (26, 2000, "2021-10-05", 1, 1);
  INSERT INTO Orders(ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PROD_ID)
 VALUES (30, 3500, "2021-08-16", 4, 3);
  INSERT INTO Orders(ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PROD_ID)
 VALUES (50, 2000, "2021-10-06", 2, 1);

-- creating table Rating

 CREATE TABLE Rating( RAT_ID INT PRIMARY KEY auto_increment, CUS_ID INT NOT NULL, 
 SUPP_ID INT NOT NULL, RAT_RATSTARS INT);

-- inserting records into Rating

 INSERT INTO Rating(CUS_ID, SUPP_ID, RAT_RATSTARS)
 VALUES( 2, 2, 4);
 INSERT INTO Rating(CUS_ID, SUPP_ID, RAT_RATSTARS)
 VALUES( 3, 4, 3);
 INSERT INTO Rating(CUS_ID, SUPP_ID, RAT_RATSTARS)
 VALUES(5, 1, 5);
 INSERT INTO Rating(CUS_ID, SUPP_ID, RAT_RATSTARS)
 VALUES(1,3, 2);
 INSERT INTO Rating(CUS_ID, SUPP_ID, RAT_RATSTARS)
 VALUES(4, 5, 4);

 SELECT * FROM RATING;

 -- Q3 DISPLAY NO OF CUSTOMERS PER GENDER
 SELECT CUSTOMER.CUS_GENDER, COUNT(ORDERS.CUS_ID) AS "No of Customers" FROM CUSTOMER, ORDERS
 WHERE CUSTOMER.CUS_ID = ORDERS.CUS_ID 
 AND ORDERS.ORD_AMOUNT >=3000
 GROUP BY CUS_GENDER;  


 
 --Q4 DETAILS orders by customer id =2
 SELECT O.*, P.PRO_NAME 
 FROM  ORDERS O, PRODUCT P, PRODUCTDETAILS PD
 WHERE O.PROD_ID = PD.PROD_ID
 AND PD.PRO_ID = P.PRO_ID
 AND O.CUS_ID = 2;
 
 --  Q5 DETAILS OF rAJESH RETAILS
 SELECT S.*, COUNT(PD.SUPP_ID) 
 FROM SUPPLIER S, PRODUCTDETAILS PD
 WHERE S. SUPP_ID = PD. SUPP_ID
 GROUP BY PD.SUPP_ID
 HAVING COUNT(PD.SUPP_ID)>1;
 
 --  Q6 ORDER AMOUNT IS MINIMUM
 
 SELECT  C.CAT_NAME FROM 
 CATEGORY C, ORDERS O, ProductDetails PD, Product P 
 WHERE 
 O.Prod_Id = PD.Prod_Id and PD.Pro_id = P.Pro_id and P.Cat_id = C.Cat_id 
 and O.ORD_AMOUNT = (SELECT MIN(O.ORD_AMOUNT) FROM ORDERS O);
 
 -- Q7 display the id and name of the product ordered after 2021-10-05
 select P.PRO_ID, P.PRO_NAME 
 FROM PRODUCT P, ORDERS O, PRODUCTDETAILS PD
 WHERE O.PROD_ID = PD.PROD_ID AND PD.PRO_ID =P.PRO_ID
 AND O.ORD_DATE >"2021-10-05";
 
 -- Q8 DISPLAY FIRST THREE RATINGS
 SELECT S.SUPP_NAME, S.SUPP_ID , R.RAT_RATSTARS, C.CUS_NAME
 FROM RATING R, SUPPLIER S , CUSTOMER C 
 WHERE R.SUPP_ID = S.SUPP_ID
 AND R.CUS_ID = C.CUS_ID
 ORDER BY R.RAT_RATSTARS DESC
 LIMIT 3;

-- Q9 CUSTOMER NAME AND GENDER WHOSE NAMES START OR END WITH CHARACTER 'a'
SELECT CUS_NAME, CUS_GENDER FROM CUSTOMER 
WHERE CUS_NAME LIKE "A%" OR CUS_NAME LIKE "%A";

-- Q10 DISPLAY TOTAL ORDER AMOUNT OF THE MALE CUSTOMERS
SELECT SUM(O.ORD_AMOUNT) , C.CUS_GENDER
FROM ORDERS O, CUSTOMER C
WHERE O.CUS_ID = C.CUS_ID 
AND C.CUS_GENDER = 'M'; 

-- Q11 DISPLAY CUSTOMERS LEFT OUTER JOIN WITH ORDERS
SELECT * FROM CUSTOMER C
LEFT OUTER JOIN ORDERS O
ON C.CUS_ID =  O.CUS_ID;



-- q 12 Stored Procedure
delimiter $$
use `ecommerce`
create procedure new_procedure1()
begin
  SELECT R.RAT_RATSTARS ,
  CASE
   WHEN R.RAT_RATSTARS > 4 THEN " GENUINE SUPPLIER"
   WHEN R.RAT_RATSTARS >2 THEN " AVERAGE SUPPLIER"
   ELSE "SUPPLIER SHOULD NOT BE CONSIDERED"
END AS VERDICT
FROM RATING R;
end delimiter $$;


call  new_procedure1();