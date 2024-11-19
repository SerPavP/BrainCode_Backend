CREATE TABLE сотрудники (
    id INTEGER PRIMARY KEY,
    имя VARCHAR(50),
    должность VARCHAR(50)
);

CREATE TABLE заказы (
    номер_заказа INTEGER PRIMARY KEY,
    employee_id INTEGER,
    сумма DECIMAL(10, 2),
    дата DATE,
    FOREIGN KEY (employee_id) REFERENCES сотрудники (id)
);