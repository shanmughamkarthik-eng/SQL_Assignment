SET DEFINE OFF;
-- Create Table
CREATE TABLE Orders (
    Order_ID NUMBER PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR2(10),
    Customer_Name VARCHAR2(100),
    Product_Category VARCHAR2(100),
    Product_Name VARCHAR2(150),
    Quantity NUMBER,
    Unit_Price NUMBER(10,2),
    Payment_Mode VARCHAR2(50),
    Store_Location VARCHAR2(100)
);

-- Insert Data
INSERT ALL
    INTO Orders VALUES (1001, TO_DATE('2026-02-01','YYYY-MM-DD'), 'C001', 'Ravi Kumar', 'Electronics', 'Wireless Mouse', 2, 799, 'UPI', 'Bangalore')
    INTO Orders VALUES (1002, TO_DATE('2026-02-02','YYYY-MM-DD'), 'C002', 'Sneha Reddy', 'Grocery', 'Basmati Rice 5kg', 1, 650, 'Credit Card', 'Hyderabad')
    INTO Orders VALUES (1003, TO_DATE('2026-02-03','YYYY-MM-DD'), 'C003', 'Arjun Mehta', 'Fashion', 'Men''s T-Shirt', 3, 499, 'Cash', 'Chennai')
    INTO Orders VALUES (1004, TO_DATE('2026-02-04','YYYY-MM-DD'), 'C004', 'Priya Sharma', 'Electronics', 'Bluetooth Speaker', 1, 1499, 'Debit Card', 'Mumbai')
    INTO Orders VALUES (1005, TO_DATE('2026-02-05','YYYY-MM-DD'), 'C005', 'Kiran Rao', 'Home & Kitchen', 'Mixer Grinder', 1, 2499, 'UPI', 'Bangalore')
    INTO Orders VALUES (1006, TO_DATE('2026-02-06','YYYY-MM-DD'), 'C006', 'Neha Verma', 'Beauty', 'Face Cream', 4, 299, 'Credit Card', 'Delhi')
    INTO Orders VALUES (1007, TO_DATE('2026-02-07','YYYY-MM-DD'), 'C007', 'Rahul Das', 'Grocery', 'Cooking Oil 1L', 5, 180, 'Cash', 'Kolkata')
    INTO Orders VALUES (1008, TO_DATE('2026-02-08','YYYY-MM-DD'), 'C008', 'Anjali Nair', 'Fashion', 'Women''s Jeans', 2, 1199, 'UPI', 'Kochi')
    INTO Orders VALUES (1009, TO_DATE('2026-02-09','YYYY-MM-DD'), 'C009', 'Suresh Patel', 'Electronics', 'Smartphone', 1, 15999, 'Debit Card', 'Ahmedabad')
    INTO Orders VALUES (1010, TO_DATE('2026-02-10','YYYY-MM-DD'), 'C010', 'Meena Iyer', 'Home & Kitchen', 'Pressure Cooker', 1, 1899, 'Credit Card', 'Pune')
SELECT * FROM DUAL;

COMMIT;

-- # STRING FUNCTIONS – 20 Questions

-- 1. Write a query to convert all customer names to uppercase.
select upper(Customer_Name) as Customer_Name_Upper from ORDERS;

-- 2. Extract the first 5 characters from Product_Name.
SELECT substr(Product_Name, 1, 5) as First_Five_char FROM orders;

-- 3. Find the length of each Customer_Name.
SELECT Customer_Name, length( Customer_Name ) as length_ from ORDERS;

-- 4. Replace the word "Rice" with "Premium Rice" in Product_Name.
SELECT replace(Product_Name,'Rice','Premium Rice') as Product_Name from ORDERS;

-- 5. Remove leading and trailing spaces from Customer_Name.
SELECT trim(Customer_Name) FROM ORDERS;

-- 6. Concatenate First_Name and Last_Name as Full_Name.
SELECT replace(Customer_Name, ' ','') as Full_Name from ORDERS;

-- 7. Find customers whose names start with 'A'.
SELECT Customer_Name FROM ORDERS
where substr(customer_name, 1, 1) = 'A' ;

-- 8. Extract the domain name from Email_ID.
SELECT substr(EMAIL, instr(EMAIL, '@')+1) as domain from hr.EMPLOYEES;

-- 9. Find the position of '@' in Email_ID.
 SELECT Email, instr(email, '@') From hr.EMPLOYEES;

-- 10. Reverse the Product_Name.
select Product_Name, Reverse(product_name) as reversed from ORDERS;

-- 11. Convert the first letter of each word in Product_Name to uppercase.
SELECT initcap(product_name) as PRODUCT_NAME from Orders;

-- 12. Extract the last 3 characters from Order_ID.
SELECT Order_ID, substr(order_id, -3)as last_three from ORDERS;

-- 13. Count how many times letter 'a' appears in Customer_Name.
select customer_name,
(length(CUSTOMER_NAME) - length(replace(lower(CUSTOMER_NAME), 'a', ''))) as letter_count
FROM ORDERS;

-- 14. Mask the last 4 digits of a phone number.
SELECT 
    SUBSTR(PHONE_NUMBER, 1, length(PHONE_NUMBER)-4) || '****' as PHONE_NUMBER_masked
FROM hr.EMPLOYEES;

-- 15. Split Full_Name into First_Name and Last_Name.
SELECT CUSTOMER_NAME,
substr(customer_Name, 1, instr(CUSTOMER_NAME, ' ')-1) as First_name,
substr(customer_Name, instr(CUSTOMER_NAME, ' ')+1) as Last_name 
from orders;

-- 16. Remove all special characters from Product_Code.
SELECT replace(product_category, '&','') as product_category from ORDERS;

-- 17. Compare two columns ignoring case sensitivity.
SELECT CUSTOMER_NAME, PRODUCT_NAME from ORDERS
where upper(CUSTOMER_NAME) = upper(PRODUCT_NAME);

-- 18. Find customers whose name contains 'kumar'.
SELECT CUSTOMER_NAME from ORDERS
WHERE lower(CUSTOMER_NAME) LIKE '%kumar%';

-- 19. Pad Order_ID with leading zeros to make it 6 digits
SELECT LPAD(Customer_ID, 6, 0) as CUSTOMER_ID from ORDERS;

--  20. Extract substring between two characters.
SELECT substr(email, instr(email, '@')+1,
    instr(email, '.') - instr(email, '@') -1
) as domain
from hr.EMPLOYEES;