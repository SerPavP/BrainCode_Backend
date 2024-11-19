-- 1. Общая стоимость заказов по каждому производителю
SELECT 
    m.manufacturer_name,
    SUM(o.quantity * p.price) AS total_order_cost
FROM orders o
JOIN products p ON o.product_id = p.product_id
JOIN manufacturers m ON p.product_id = m.manufacturer_id
GROUP BY m.manufacturer_name;

-- 2. Товар с наибольшим количеством на складе в каждой категории
SELECT 
    c.category_name,
    p.product_name,
    p.stock
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE p.stock = (
    SELECT MAX(stock)
    FROM products p2
    WHERE p2.category_id = p.category_id
);

-- 3. Производители товаров категории "Электроника"
SELECT DISTINCT 
    m.manufacturer_name
FROM manufacturers m
JOIN products p ON m.manufacturer_id = p.manufacturer_id
JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name = 'Электроника';

-- 4. Заказы первого полугодия 2024 года
SELECT *
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-06-30';

-- 5. Категория товаров с наибольшим доходом
SELECT 
    c.category_name,
    SUM(o.quantity * p.price) AS total_income
FROM orders o
JOIN products p ON o.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_income DESC
LIMIT 1;

-- 6. Средняя стоимость товаров в каждой категории
SELECT 
    c.category_name,
    AVG(p.price) AS average_price
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- 7. Удаление товаров без заказов
DELETE FROM products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM orders);

-- 8. Обновление стока после заказов
UPDATE products
SET stock = stock - (
    SELECT COALESCE(SUM(o.quantity), 0)
    FROM orders o
    WHERE o.product_id = products.product_id
)
WHERE product_id IN (SELECT DISTINCT product_id FROM orders);

-- 9. Страны с более чем одним производителем
SELECT 
    country,
    COUNT(manufacturer_id) AS manufacturer_count
FROM manufacturers
GROUP BY country
HAVING COUNT(manufacturer_id) > 1;

-- 10. Создание новой категории и добавление продуктов
INSERT INTO categories (category_id, category_name) VALUES (5, 'Бытовая техника');

INSERT INTO products (product_id, product_name, category_id, price, stock) VALUES
(11, 'Микроволновая печь', 5, 15000.00, 50),
(12, 'Пылесос', 5, 12000.00, 30);

-- 11. Отчёт за 2024 год: количество проданных товаров по месяцам
SELECT 
    strftime('%Y-%m', order_date) AS month,
    SUM(quantity) AS total_sold
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY strftime('%Y-%m', order_date)
ORDER BY month;

-- 12. Удаление производителя, чьи товары никогда не заказывались
DELETE FROM manufacturers
WHERE manufacturer_id NOT IN (
    SELECT DISTINCT m.manufacturer_id
    FROM manufacturers m
    JOIN products p ON m.manufacturer_id = p.manufacturer_id
    JOIN orders o ON p.product_id = o.product_id
);

-- 13. Процентное изменение количества товаров на складе
WITH MonthlyStock AS (
    SELECT 
        strftime('%Y-%m', order_date) AS month,
        SUM(stock) AS total_stock
    FROM products p
    LEFT JOIN orders o ON p.product_id = o.product_id
    GROUP BY strftime('%Y-%m', order_date)
)
SELECT 
    month,
    total_stock,
    LAG(total_stock) OVER (ORDER BY month) AS previous_month_stock,
    ROUND((total_stock - LAG(total_stock) OVER (ORDER BY month)) * 100.0 / LAG(total_stock) OVER (ORDER BY month), 2) AS percent_change
FROM MonthlyStock;

-- 14. Среднее количество товаров по заказам для каждого клиента
SELECT 
    customer_id,
    AVG(o.quantity) AS average_quantity
FROM orders o
GROUP BY customer_id;