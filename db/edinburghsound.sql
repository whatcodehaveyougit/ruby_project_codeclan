DROP TABLE hire_orders;
DROP TABLE hire_stock;
DROP TABLE customers;

CREATE TABLE customers(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	address VARCHAR(255),
	phone VARCHAR(255)
);

CREATE TABLE hire_stock(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	price INT
);

CREATE TABLE hire_orders(
	id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
	hire_item_id INT REFERENCES hire_stock(id) ON DELETE CASCADE,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	notes VARCHAR
);
