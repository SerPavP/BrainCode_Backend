SELECT name, phone_number 
FROM Drivers;


SELECT description, weight 
FROM Cargo 
WHERE strftime('%Y', load_date) = strftime('%Y', DATE('now'));

SELECT * 
FROM Cargo 
WHERE weight > 1000;


SELECT * 
FROM Drivers 
WHERE license_number LIKE '5%';
