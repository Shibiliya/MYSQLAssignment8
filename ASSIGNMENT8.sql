USE entri_d42;
SELECT *FROM Country;
SELECT *FROM Persons;
SELECT Country_name,COUNT(*) AS Number_of_persons FROM Persons GROUP BY Country_name;

SELECT Country_name,COUNT(*) AS Number_of_persons FROM Persons GROUP BY Country_name
ORDER BY Number_of_persons DESC;

SELECT Country_name,AVG(Rating) AS Average_rating FROM Persons GROUP BY Country_name
HAVING AVG(Rating)>3.0;

SELECT Country_name FROM Persons WHERE Rating=(SELECT Rating FROM Persons WHERE Country_name='USA');

SELECT Country_name,Population FROM Country
WHERE Population>(SELECT AVG(Population) FROM Country);

-- Creating a new data base
CREATE DATABASE Product;
USE Product;
CREATE TABLE Customer(
Customer_id INT PRIMARY KEY,
First_name VARCHAR(50),
Last_name VARCHAR(50),
Email VARCHAR(100),
Phone_no VARCHAR(15),
Address VARCHAR(255),
City VARCHAR(50),
State VARCHAR(50),
Zip_code VARCHAR(10),
Country VARCHAR(50)
);

CREATE VIEW customer_info AS 
SELECT CONCAT(First_name, ' ',Last_name) AS Full_name,Email FROM Customer;
SELECT *FROM customer_info;

CREATE VIEW US_Customers AS 
SELECT *FROM Customer 
WHERE Country='US';

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ',Last_name) AS Full_name,Email,Phone_no,State FROM Customer;

SET SQL_SAFE_UPDATES =0;
UPDATE Customer SET Phone_no='9867356710' WHERE State='California';


SELECT State,COUNT(*) AS Number_of_customers FROM Customer
GROUP BY State HAVING COUNT(*)>5;

SELECT State,COUNT(*) AS Number_of_customers FROM Customer_details
GROUP BY State;

SELECT *FROM Customer_details ORDER BY State ASC;




