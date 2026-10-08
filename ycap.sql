CREATE TABLE customer (

cust_id VARCHAR(5) PRIMARY KEY,
f_name VARCHAR(50),
l_name VARCHAR(50),
area VARCHAR(10),
phone_no VARCHAR(10)
);
INSERT INTO customer (cust_id, f_name, l_name, area, phone_no) VALUES
('C01', 'Amit', 'Sharma', 'DA', '9876543210'),
('C02', 'Priya', 'Patil', 'MU', '9876543211'),
('C03', 'Rajesh', 'Kumar', 'GH', '9876543212'),
('C04', 'Pooja', 'Verma', 'DA', '9876543213'),
('C05', 'Rahul', 'Joshi', 'JK', '9876543214'),
('C06', 'Sneha', 'Deshmukh', 'MU', '9876543215'),
('C07', 'Pranav', 'Shinde', 'GH', '9876543216'),
('C08', 'Neha', 'Kulkarni', 'DA', '9876543217'),
('C09', 'Rohan', 'Mehta', 'AB', '9876543218'),
('C10', 'Pallavi', 'More', 'MU', '9876543219');
CREATE TABLE category (
category_id VARCHAR(5) PRIMARY KEY,
category_name VARCHAR(30)
);
INSERT INTO category (category_id, category_name) VALUES
('CAT01', 'Electronics'),
('CAT02', 'Clothing'),
('CAT03', 'Books'),
('CAT04', 'Home'),
('CAT05', 'Sports');
CREATE TABLE product (
product_id VARCHAR(5) PRIMARY KEY,
product_name VARCHAR(50),
category_id VARCHAR(5),
price DECIMAL(8,2),
stock INT,
FOREIGN KEY (category_id) REFERENCES category(category_id)
);
INSERT INTO product (product_id, product_name, category_id, price, stock) VALUES
('P01', 'Laptop', 'CAT01', 50000.00, 10),
('P02', 'Smartphone', 'CAT01', 25000.00, 20),
('P03', 'Headphones', 'CAT01', 1500.00, 30),
('P04', 'T-Shirt', 'CAT02', 500.00, 50),
('P05', 'Jeans', 'CAT02', 1800.00, 25),
('P06', 'Novel', 'CAT03', 350.00, 40),
('P07', 'Table Lamp', 'CAT04', 1200.00, 15),
('P08', 'Cricket Bat', 'CAT05', 2500.00, 12),
('P09', 'Running Shoes', 'CAT05', 3000.00, 18),
('P10', 'Keyboard', 'CAT01', 1800.00, 22);
CREATE TABLE orders (
order_id VARCHAR(5) PRIMARY KEY,
cust_id VARCHAR(5),
order_date DATE,

total_amount DECIMAL(10,2),
FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);
INSERT INTO orders (order_id, cust_id, order_date, total_amount) VALUES
('O01', 'C01', '2023-07-10', 51500.00),
('O02', 'C02', '2023-07-15', 3000.00),
('O03', 'C03', '2023-07-25', 25000.00),
('O04', 'C04', '2023-08-05', 2300.00),
('O05', 'C05', '2023-08-10', 10000.00),
('O06', 'C02', '2023-08-15', 5000.00),
('O07', 'C06', '2023-08-20', 3500.00),
('O08', 'C07', '2023-09-01', 1800.00),
('O09', 'C03', '2023-09-05', 5500.00),
('O10', 'C04', '2023-09-10', 2500.00);
CREATE TABLE order_items (
order_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id VARCHAR(5),
product_id VARCHAR(5),
quantity INT,
price DECIMAL(8,2),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES product(product_id)
);
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
('O01', 'P01', 1, 50000.00),
('O01', 'P03', 1, 1500.00),

('O02', 'P04', 2, 500.00),
('O02', 'P03', 1, 1500.00),

('O03', 'P02', 1, 25000.00),

('O04', 'P05', 1, 1800.00),
('O04', 'P06', 1, 350.00),

('O05', 'P08', 2, 2500.00),

('O06', 'P09', 1, 3000.00),
('O06', 'P04', 4, 500.00),

('O07', 'P03', 2, 1500.00),
('O07', 'P04', 1, 500.00),

('O08', 'P10', 1, 1800.00),

('O09', 'P08', 1, 2500.00),
('O09', 'P09', 1, 3000.00),

('O10', 'P04', 5, 500.00);
CREATE TABLE invoice (
inv_no VARCHAR(5) PRIMARY KEY,
order_id VARCHAR(5),
inv_date DATE,
amount DECIMAL(10,2),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO invoice (inv_no, order_id, inv_date, amount) VALUES
('I01', 'O01', '2023-07-10', 51500.00),
('I02', 'O02', '2023-07-15', 2500.00),
('I03', 'O03', '2023-07-25', 25000.00),
('I04', 'O04', '2023-08-05', 2150.00),
('I05', 'O05', '2023-08-10', 5000.00),
('I06', 'O06', '2023-08-15', 5000.00),
('I07', 'O07', '2023-08-20', 3500.00),
('I08', 'O08', '2023-09-01', 1800.00),
('I09', 'O09', '2023-09-05', 5500.00),
('I10', 'O10', '2023-09-10', 2500.00);
CREATE TABLE payment (
payment_id VARCHAR(5) PRIMARY KEY,
inv_no VARCHAR(5),
payment_date DATE,
payment_mode VARCHAR(20),
payment_status VARCHAR(15),
FOREIGN KEY (inv_no) REFERENCES invoice(inv_no)
);
INSERT INTO payment (payment_id, inv_no, payment_date, payment_mode, payment_status) VALUES
('P01', 'I01', '2023-07-10', 'UPI', 'SUCCESS'),
('P02', 'I02', '2023-07-15', 'CARD', 'SUCCESS'),
('P03', 'I03', '2023-07-25', 'UPI', 'SUCCESS'),
('P04', 'I04', '2023-08-05', 'CARD', 'FAILED'),
('P05', 'I05', '2023-08-10', 'UPI', 'SUCCESS'),
('P06', 'I06', '2023-08-15', 'CARD', 'SUCCESS'),
('P07', 'I07', '2023-08-20', 'UPI', 'FAILED'),
('P08', 'I08', '2023-09-01', 'CARD', 'SUCCESS'),
('P09', 'I09', '2023-09-05', 'UPI', 'SUCCESS'),
('P10', 'I10', '2023-09-10', 'CARD', 'FAILED');
SELECT * FROM payment;
SELECT * FROM invoice;
SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM product;
SELECT * FROM customer;
SELECT f_name, l_name, area FROM Customer WHERE cust_id = 'C03';
SELECT f_name, l_name, phone_no FROM Customer;
SELECT COUNT(*) FROM Customer;
SELECT * FROM Customer WHERE area = 'DA' OR area = 'MU' OR area = 'GH';
UPDATE Customer SET area = 'JK' WHERE cust_id = 'C01';
SELECT * FROM Customer WHERE f_name LIKE 'P%';
SELECT * FROM Customer WHERE area LIKE '_A%';
UPDATE Customer SET phone_no = 567889 WHERE f_name = 'Rajesh';
DELETE FROM Customer WHERE cust_id = 'C09';
SELECT * FROM Customer;
SELECT * FROM Category;
SELECT * FROM Product WHERE price > 150;
SELECT * FROM Product WHERE price BETWEEN 100 AND 180;
SELECT product_name, price FROM Product;
SELECT category_id, COUNT(*) AS product_per_category FROM Product GROUP BY category_id;
SELECT MAX(price), MIN(price) FROM Product;
SELECT AVG(price) FROM Product;
SELECT * FROM Product WHERE category_id = 'CAT01' OR category_id = 'CAT02';
UPDATE Product SET price = 55000 WHERE product_name = 'Laptop';
SELECT * FROM Product ORDER BY Product_name ASC;
SELECT * FROM Orders;
SELECT * FROM Orders WHERE cust_id = 'C02';
SELECT COUNT(*) FROM Orders;
SELECT * FROM Orders WHERE order_date < '2023-08-01';
SELECT order_id, order_date FROM Orders;
UPDATE Orders SET total_amount = 12000 WHERE cust_id = 'C05';
