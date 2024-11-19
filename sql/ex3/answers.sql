-- 1. Найдите общее количество проданных единиц товара
SELECT SUM(quantity) AS количество
FROM orders;

-- 2. Определите категорию, из которой было продано наибольшее количество товаров
SELECT c.category_name, SUM(o.quantity) AS продано
FROM orders o
JOIN products p ON o.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY продано DESC
LIMIT 1;

-- 3. Подсчитайте количество товаров, проданных по каждой категории
SELECT c.category_name, SUM(o.quantity) AS продано
FROM orders o
JOIN products p ON o.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- 4. Найдите дату, на которую было продано больше всего товаров
SELECT order_date, SUM(quantity) AS продано
FROM orders
GROUP BY order_date
ORDER BY продано DESC
LIMIT 1;

-- 5. Удалите все заказы, сделанные до 1 марта 2024 года
DELETE FROM orders
WHERE order_date < '2024-03-01';

-- 6. Удалите продукты, которые закончились на складе (stock = 0)
DELETE FROM products
WHERE stock = 0;

-- 7. Увеличьте цену всех товаров в категории "Электроника" на 10%
UPDATE products
SET price = price * 1.1
WHERE category_id = (
    SELECT category_id
    FROM categories
    WHERE category_name = 'Электроника'
);

-- 8. Измените количество на складе для продукта "Футболка" на 300 единиц
UPDATE products
SET stock = 300
WHERE product_name = 'Футболка';

-- 9. Удалите таблицу orders после выполнения всех заданий
DROP TABLE orders;

-- 10. Удалите таблицу products
DROP TABLE products;