--1
USE another_waffle_restaurant

--2
SELECT HEX(products.product_id)
AS Product_ID_Hexadecimal, products.product_name
FROM products
INNER JOIN product_types
ON products.product_type_id = product_types.product_type_id
WHERE product_types.is_vegan = "yes";

--3
SELECT UPPER(customer_name)
AS Name, customer_address
FROM customers
WHERE customer_address LIKE '%Street%'
UNION SELECT UPPER (staff_name) 
AS Name, staff_address
FROM staffs 
WHERE staff_address LIKE '%Street%' GROUP BY Name;

--4


--5
ALTER TABLE staffs
ADD CONSTRAINT Ck_staff_name 
CHECK(LENGTH(staff_name)>6);

--6
UPDATE products, product_types
SET products.product_price = products.product_price-2,
product_types.is_vegan = 'No'
WHERE products.product_type_id
AND product_types.product_type_id
IN ('PT001', 'PT005')
AND products.product_id
IN (SELECT transaction_details.product_id FROM transaction_details INNER JOIN transaction_headers ON transaction_details.transaction_id = transaction_headers.transaction_id
WHERE QUARTER(transaction_headers.transaction_date) = 2 
    AND YEAR (transaction_headers.transaction_date) = 2020);

SELECT products.product_id, products.product_name, products.product_price, products.product_type_id, product_types.product_type_id, product_types.product_type_name, product_types.is_vegan
FROM products
INNER JOIN product_types
ON products.product_type_id =product_types.product_type_id;

--7
SELECT transaction_headers.customer_id, transaction_headers.transaction_date,(transaction_details.quantity*products.product_price /1000) * (DATEDIFF('25-12-2022', customers.joined_date))
AS TransactionPoint FROM transaction_headers INNER JOIN transaction_details ON transaction_headers.transaction_id = transaction_details.transaction_id INNER JOIN products ON products.product_id = transaction_details.product_id INNER JOIN customers ON customers.customer_id = transaction_headers.customer_id WHERE MONTH(customers.joined_date) = 12 AND products.product_price >30000;