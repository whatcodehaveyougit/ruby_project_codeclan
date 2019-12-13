DROP TABLE hired_equipment;
DROP TABLE customers;
DROP TABLE equipment;

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	address VARCHAR(255),
	phone INT
);

CREATE TABLE equipment_stock (
	id SERIAL PRIMARY KEY,
	item VARCHAR(255),
	price INT
);

CREATE TABLE hire_order (
	id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customers(id),
	equipment_id INT REFERENCES equipment_stock(id),
	start_date INT,
	end_date INT,
	notes VARCHAR
);