-- 1. Get all customers and their addresses.
SELECT customers.first_name, addresses.street 
FROM customers
JOIN addresses ON customers.id = addresses.customer_id;

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT orders.id, line_items.quantity, products.description 
FROM orders
JOIN line_items ON line_items.order_id = orders.id
JOIN products ON products.id = line_items.product_id;

-- 3. Which warehouses have cheetos?
SELECT products.description, warehouse.warehouse
FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse.id = warehouse_product.warehouse_id
WHERE products.description = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT products.description, warehouse.warehouse
FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse.id = warehouse_product.warehouse_id
WHERE products.description = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, COUNT(*) AS order_num
FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
GROUP BY customers.first_name;

-- 6. How many customers do we have?
SELECT COUNT(*) AS customer_count
FROM customers;

-- 7. How many products do we carry?
SELECT COUNT(*) AS product_count
FROM products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT products.description, SUM(warehouse_product.on_hand) AS diet_pepsi_on_hand
FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi'
GROUP BY products.description;

-- Stretch
-- 9. How much was the total cost for each order?
-- 10. How much has each customer spent in total?
-- 11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).