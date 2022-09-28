DROP DATABASE IF EXISTS restaurant_management_systems;
CREATE DATABASE restaurant_management_systems;
USE restaurant_management_systems;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS tables;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS bill;
DROP TABLE IF EXISTS orderItem;


CREATE TABLE users(userId INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(200),email VARCHAR(200),phone VARCHAR(50),password VARCHAR(500),profileImage VARCHAR(100),role VARCHAR(50), createdDate DATE  DEFAULT(CURDATE()),currentStatus VARCHAR(50));
CREATE TABLE category(categoryId INT PRIMARY KEY AUTO_INCREMENT,categoryName VARCHAR(50),categoryStatus VARCHAR(50));
CREATE TABLE tables(tableId INT PRIMARY KEY AUTO_INCREMENT,tableName VARCHAR(50),tableCapacity INT,waiterId INT,tableStatus VARCHAR(50),FOREIGN KEY (waiterId) REFERENCES users(userId));
CREATE TABLE product(productId INT PRIMARY KEY AUTO_INCREMENT,productName VARCHAR(50), productPrice DECIMAL(6, 2),productcategoryId INT,productStatus VARCHAR(50),FOREIGN KEY (productcategoryId) REFERENCES category(categoryId));
CREATE TABLE orders(orderId INT PRIMARY KEY AUTO_INCREMENT,orderServicePersonId INT,orderTableId INT,orderStatus VARCHAR(50),FOREIGN KEY (orderServicePersonId) REFERENCES users(userId),FOREIGN KEY (orderTableId) REFERENCES tables(tableId))AUTO_INCREMENT=1001;
CREATE TABLE bill(billId INT PRIMARY KEY AUTO_INCREMENT,billOrderId INT,billCashierId INT,taxAndCharge DECIMAL(4,2) DEFAULT 5,discount DECIMAL(4,2),billAmount DECIMAL(8,2),billTotal DECIMAL(8,2),billDate DATE DEFAULT(CURDATE()),billPaymentMethod VARCHAR(50),billStatus VARCHAR(50),FOREIGN KEY (billCashierId) REFERENCES users(userId),FOREIGN KEY (billOrderId) REFERENCES orders(orderId));
CREATE TABLE orderitem(orderItemId INT PRIMARY KEY AUTO_INCREMENT,orderItemOrderId INT,orderItemProductId INT,orderItemQuantity INT,orderItemAmount DECIMAL(8,2),FOREIGN KEY (orderItemProductId) REFERENCES product(productId),FOREIGN KEY (orderItemOrderId) REFERENCES orders(orderId));






INSERT INTO users(name,email,phone,password,role,profileImage,currentStatus) VALUES("Mahesh","mahesh123@gmail.com","9887421525","$2a$12$OWJrlRzEojbzEejd.QwsVu2UQ53x9FeTjIzI.g0XKIUX11cuyuPL2","manager","1301120.jpg","Enabled");
INSERT INTO category(categoryName,categoryStatus) VALUES("Sandwich","Enabled");
INSERT INTO tables(tableName,tableCapacity,tableStatus) VALUES("Table 4",4,"Not Booked");
insert into product(productName,productPrice,productStatus,productcategoryId) VALUES("Veg Sandwich",125,"Enabled",1);



INSERT INTO users(name,email,phone,password,role,profileImage,currentStatus) VALUES("Mahesh","mahesh123@gmail.com","9887421525","$2a$10$8m5TwjMexSIBlyHVJhfn3OThzSqQglBDfM6xDO9bW/eaY00XEMBku","chef","1301120.jpg","Enabled");






INSERT INTO users(name,email,phone,password,role,profileImage,currentStatus) VALUES("Mahesh","mahesh123@gmail.com","9887421525","$2a$10$8m5TwjMexSIBlyHVJhfn3OThzSqQglBDfM6xDO9bW/eaY00XEMBku","chef","1301120.jpg","Enabled");






