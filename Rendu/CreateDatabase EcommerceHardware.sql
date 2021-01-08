/*
 * Authors : Benjamin Muminovic & Axel Pittet
 * Date : 08.01.2020
 * Project : EcommerceHardware
*/

DROP DATABASE IF EXISTS EcommerceHardware;
CREATE DATABASE EcommerceHardware;

CREATE TABLE STATUTES (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[name] VARCHAR(45) NOT NULL
)

CREATE TABLE promotions (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[name] VARCHAR(45) NOT NULL,
	[year] INT NOT NULL,
	discount INT NOT NULL
)

CREATE TABLE providers (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[name] VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	head_office VARCHAR(45),
	phone_number VARCHAR(45)
)

CREATE TABLE categories(
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[name] VARCHAR(45) NOT NULL
)

CREATE TABLE clients (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	client_number VARCHAR(45) NOT NULL,
	firstname VARCHAR(45) NOT NULL,
	birthyear SMALLINT NOT NULL,
	email VARCHAR(45) NOT NULL,
	zip_code INT NOT NULL,
	city VARCHAR(60) NOT NULL,
	[address] VARCHAR(60) NOT NULL
)

CREATE TABLE orders (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	order_number VARCHAR(45) NOT NULL,
	order_date DATE NOT NULL,
	[state] VARCHAR(45),
	quantity INT NOT NULL
)

CREATE TABLE components (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	productNumber VARCHAR(45) NOT NULL,
	[name] VARCHAR(45) NOT NULL,
	maker VARCHAR(45),
	description VARCHAR(1024),
	price DECIMAL(8,2) NOT NULL,
	stock INT,
	discount VARCHAR(45)
)

CREATE TABLE clients_benefits_promotions (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
)

CREATE TABLE order_includes_components (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
)

CREATE TABLE clients_comment_components (
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	title VARCHAR(128) NOT NULL,
	[text] VARCHAR(1024),
	likes VARCHAR(45) NOT NULL
)

-- UNIQUE constraints

CREATE UNIQUE INDEX UX_statutes ON statutes (`name`);
CREATE UNIQUE INDEX UX_promotions ON promotions (`name`, `year`);
CREATE UNIQUE INDEX UX_provider ON provider (`name`, `email`);
CREATE UNIQUE INDEX UX_categories ON categories (`name`);
CREATE UNIQUE INDEX UX_clients ON clients (`client_number`);
CREATE UNIQUE INDEX UX_orders ON orders (`order_number`);
CREATE UNIQUE INDEX UX_components ON components (`productNumber`);


-- REFERENTIAL constraints

ALTER TABLE clients WITH CHECK ADD FOREIGN KEY (statutes_id) REFERENCES statutes(id);

ALTER TABLE clients_benefits_promotions WITH CHECK ADD FOREIGN KEY (clients_id) REFERENCES clients(id);

ALTER TABLE clients_benefits_promotions WITH CHECK ADD FOREIGN KEY (promotions_id) REFERENCES promotions(id);

ALTER TABLE components WITH CHECK ADD FOREIGN KEY (providers_id) REFERENCES providers(id);

ALTER TABLE components WITH CHECK ADD FOREIGN KEY (categories_id) REFERENCES categories(id);

ALTER TABLE orders WITH CHECK ADD FOREIGN KEY (clients_id) REFERENCES clients(id);

ALTER TABLE order_includes_components WITH CHECK ADD FOREIGN KEY (components_id) REFERENCES components(id);

ALTER TABLE order_includes_components WITH CHECK ADD FOREIGN KEY (orders_id) REFERENCES orders(id);

ALTER TABLE clients_comment_components WITH CHECK ADD FOREIGN KEY (components_id) REFERENCES components(id);

ALTER TABLE clients_comment_components WITH CHECK ADD FOREIGN KEY (orders_id) REFERENCES orders(id);