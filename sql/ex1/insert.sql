-- Вставка данных в таблицу Drivers
INSERT INTO Drivers (driver_id, name, license_number, birth_date, phone_number)
VALUES
(1, 'John Doe', '5123456789', '1985-04-12', '+1234567890'),
(2, 'Jane Smith', '5234567890', '1990-08-22', '+0987654321'),
(3, 'Mike Johnson', '5345678901', '1980-01-15', '+1122334455'),
(4, 'Emily Davis', '5432109876', '1995-07-19', '+2233445566'),
(5, 'Chris Brown', '5001234567', '1983-03-27', '+3344556677');

-- Вставка данных в таблицу Cargo
INSERT INTO Cargo (cargo_id, description, weight, load_date, destination)
VALUES
(1, 'Furniture', 850.50, '2024-03-10', 'New York'),
(2, 'Electronics', 1200.00, '2024-01-15', 'Los Angeles'),
(3, 'Food Supplies', 950.25, '2024-02-28', 'Chicago'),
(4, 'Building Materials', 2500.75, '2024-06-18', 'Houston'),
(5, 'Clothing', 600.00, '2024-05-22', 'Miami'),
(6, 'Machinery', 1800.00, '2024-08-05', 'San Francisco'),
(7, 'Books', 500.00, '2023-12-12', 'Boston');
