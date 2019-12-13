DROP TABLE hire_orders;
DROP TABLE customers;
DROP TABLE hire_stock;

CREATE TABLE customers(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	address VARCHAR(255),
	phone INT
);

CREATE TABLE hire_stock(
	id SERIAL PRIMARY KEY,
	item VARCHAR(255),
	price INT
);

CREATE TABLE hire_orders(
	id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
	equipment_id INT REFERENCES equipment_stock(id) ON DELETE CASCADE,
	start_date INT,
	end_date INT,
	notes VARCHAR
);
