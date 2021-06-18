DROP DATABASE doctor_database;

CREATE DATABASE doctor_database;

USE doctor_database;

CREATE TABLE  addresses(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	city VARCHAR(60) NOT NULL,
	region VARCHAR(60) NOT NULL,
	country VARCHAR(60) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE people(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,	
	id_addresses INT NOT NULL,
	name VARCHAR(60) NOT NULL,
	surname VARCHAR(60) NOT NULL,
	birthdate DATETIME,
	email VARCHAR(60) NOT NULL,
	password VARCHAR(60) NOT NULL,
	sex VARCHAR(30),
	CONSTRAINT fk_addresses FOREIGN KEY (id_addresses) REFERENCES addresses (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE clients(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_people INT NOT NULL,
	billing_address VARCHAR(255) NOT NULL,
	newsletter BOOLEAN NOT NULL,
	CONSTRAINT fk_people FOREIGN KEY (id_people) REFERENCES people (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE articles(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	title LONG VARCHAR NOT NULL,
	dates DATETIME,
	description LONG VARCHAR
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE administrators(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_people INT NOT NULL,
	id_articles INT NOT NULL,
	FOREIGN KEY (id_people) REFERENCES people (id),
	FOREIGN KEY (id_articles) REFERENCES articles (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE messages(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	from_user VARCHAR(60) NOT NULL,
	to_user VARCHAR(60) NOT NULL,
	title VARCHAR(255) NOT NULL,
	messages_user LONG VARCHAR NOT NULL,
	dates_user DATETIME,
	read_user BOOLEAN NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE  pictures(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	path_pictures VARCHAR(255)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE  products(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_pictures INT NOT NULL,
	title VARCHAR(255) NOT NULL,
	description LONG VARCHAR NOT NULL,
	valor DOUBLE NOT NULL,
	exist INT NOT NULL,
	FOREIGN KEY (id_pictures) REFERENCES pictures (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE  categories(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	code VARCHAR(60) NOT NULL,
	name VARCHAR(60) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE  categories_products(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_categories INT NOT NULL,
	id_products INT NOT NULL,
	FOREIGN KEY (id_categories) REFERENCES categories (id),
	FOREIGN KEY (id_products) REFERENCES products (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE  comments(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	text LONG VARCHAR NOT NULL,
	date_comments DATETIME,
	text_resp LONG VARCHAR,
	date_resp DATETIME,
	id_products INT NOT NULL,
	id_clients INT NOT NULL,
	id_administrators INT NOT NULL,
	FOREIGN KEY (id_products) REFERENCES products (id),
	FOREIGN KEY (id_clients) REFERENCES clients (id),
	FOREIGN KEY (id_administrators) REFERENCES administrators (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE order_products(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	dates DATETIME,
	total DOUBLE NOT NULL,
	method_payment VARCHAR(60) NOT NULL,
	paid BOOLEAN,
	deliveret BOOLEAN,
	shipping_address VARCHAR(255) NOT NULL,
	billing_address VARCHAR(255) NOT NULL,
	transport_company VARCHAR(60) NOT NULL,
	nroDocuments VARCHAR(30) NOT NULL,
	guia VARCHAR(255) NOT NULL,
	id_clients INT NOT NULL,
	FOREIGN KEY (id_clients) REFERENCES clients (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE details_order(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	quantity INT NOT NULL,
	products DOUBLE NOT NULL,
	subtotal DOUBLE NOT NULL,
	cost_shipping DOUBLE NOT NULL,
	id_products INT NOT NULL,
	id_order_products INT NOT NULL,
	FOREIGN KEY (id_products) REFERENCES products (id),
	FOREIGN KEY (id_order_products) REFERENCES order_products(id)
	
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
