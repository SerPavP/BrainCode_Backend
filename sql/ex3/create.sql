
-- Создание таблицы категорий
CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL
);

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Электроника'),
(2, 'Одежда'),
(3, 'Книги'),
(4, 'Игрушки');

-- Создание таблицы продуктов
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category_id INTEGER,
    price DECIMAL(10, 2),
    stock INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

INSERT INTO products (product_id, product_name, category_id, price, stock) VALUES
(1, 'Смартфон', 1, 30000.00, 100),
(2, 'Ноутбук', 1, 70000.00, 50),
(3, 'Футболка', 2, 1500.00, 200),
(4, 'Роман "Война и мир"', 3, 500.00, 30),
(5, 'Конструктор Лего', 4, 3500.00, 40);

-- Создание таблицы заказов
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    quantity INTEGER,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO orders (order_id, product_id, quantity, order_date) VALUES
(1, 1, 2, '2024-01-15'),
(2, 3, 3, '2024-02-10'),
(3, 2, 1, '2024-03-05'),
(4, 5, 4, '2024-04-21'),
(5, 4, 2, '2024-05-01');
