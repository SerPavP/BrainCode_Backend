CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY,
    name VARCHAR(50),
    license_number CHAR(10),
    birth_date DATE,
    phone_number VARCHAR(15)
);

CREATE TABLE Cargo (
    cargo_id INT PRIMARY KEY,
    description TEXT,
    weight DECIMAL(6, 2),
    load_date DATE,
    destination VARCHAR(100)
);
