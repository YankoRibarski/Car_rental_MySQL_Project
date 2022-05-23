CREATE DATABASE Car_Rental;
CREATE TABLE `categories`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`category` VARCHAR(30) NOT NULL, 
`daily_rate` DOUBLE,
`weekly_rate`DOUBLE,
`monthly_rate`DOUBLE, 
`weekend_rate`DOUBLE
);

INSERT INTO `categories`(`id`,`category`,`daily_rate`)
VALUES("1","Sport","90.80"),
("2","Electric","200.20"),
("3","Family","150.10");
CREATE TABLE `cars`(
`id` INT PRIMARY KEY AUTO_INCREMENT, 
`plate_number` VARCHAR(20) NOT NULL,
`make` DATE,
`model` VARCHAR(30) NOT NULL, 
`car_year` YEAR,
`category_id` INT,
`doors, picture` BLOB,
`car_condition` TEXT,
`available` BOOLEAN,
CONSTRAINT fk_cars_categories
FOREIGN KEY cars(`id`) REFERENCES categories(`id`)
);

INSERT INTO `cars`(`plate_number`,`model`)
VALUES
("wsee12","SCODA"),
("klfkl33","BMW"),
("klklww56","OPEL");


CREATE TABLE `employees` (
`id` INT PRIMARY KEY AUTO_INCREMENT, 
`first_name` VARCHAR(20), 
`last_name`VARCHAR(20), 
`title`VARCHAR(20), 
`notes` TEXT
);
CREATE TABLE `customers` (
`id`INT PRIMARY KEY AUTO_INCREMENT, 
`driver_licence_number` INT, 
`full_name`VARCHAR(30), 
`address`VARCHAR(30), 
`city` VARCHAR(20),
`zip_code` INT,
`notes` TEXT
);
CREATE TABLE `rental_orders`(
`id`INT PRIMARY KEY AUTO_INCREMENT, 
`employee_id` INT, 
`customer_id` INT, 
`car_id` INT, 
`car_condition`TEXT, 
`tank_level` INT, 
`kilometrage_start` INT, 
`kilometrage_end` INT, 
`total_kilometrage` INT, 
`start_date` DATE, 
`end_date` DATE, 
`total_days` INT, 
`rate_applied` DOUBLE, 
`tax_rate` DOUBLE, 
`order_status` BOOLEAN, 
`notes` TEXT,
CONSTRAINT fk_rental_orders_employee
FOREIGN KEY `rental_orders`(id) REFERENCES `employees`(id),
CONSTRAINT fk_rental_orders_customers
FOREIGN KEY `rental_orders`(customer_id) REFERENCES `customers`(id),
CONSTRAINT fk_rental_orders_cars
FOREIGN KEY `rental_orders`(car_id) REFERENCES `cars`(id)
);
SELECT * from car_rental.cars
ORDER BY plate_number;

SELECT category FROM categories
ORDER BY category;

ALTER TABLE `rental_orders`
CHANGE COLUMN `tax_rate` `anual_tax_rate` DOUBLE;

ALTER TABLE `customers`
DROP COLUMN `notes`;

SELECT * FROM `cars`
WHERE model = "SCODA";