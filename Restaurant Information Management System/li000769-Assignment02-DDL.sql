--Name:Boyu Li
--Student Number:041003345
--Section Num:302
--Semester:Level 1
--FileName:li000769-Assignment02-DDL.sql
--Description:Write SQL code to create tables Chain_Location,Employee,Dish_Category,Menu,Invoice

--create table Chain_Location
CREATE TABLE Chain_Location(
	territory		CHAR(2),
	city 			VARCHAR(20),
	restaurant_id 	CHAR(3),
	CONSTRAINT restaurant_id_PK PRIMARY KEY (restaurant_id)
);
--create table Employee
CREATE TABLE Employee(
	name 			VARCHAR(20),
	social_number 	CHAR(9),
	CONSTRAINT social_number_PK PRIMARY KEY(social_number)
);
--create table Dish_Category
CREATE TABLE Dish_Category(
	category_id CHAR(3),
	category 	CHAR(10),
	CONSTRAINT category_id_PK PRIMARY KEY(category_id)
);
--create table Menu
CREATE TABLE Menu(
	category_id	CHAR(3),
	dish		VARCHAR(20),
	dish_id		CHAR(4),
	CONSTRAINT dish_id_PK PRIMARY KEY (dish_id),
	CONSTRAINT category_id_FK FOREIGN KEY (category_id) REFERENCES Dish_Category(category_id)
);
--create table invoice
CREATE TABLE Invoice(
	invoice_id					  CHAR(9),
	invoice_date 				  DATE,
	restaurant_id				  CHAR(3),
	invoice_dish_id				  CHAR(4),
	service_provider_socialnumber         CHAR(9),
	amount				        FLOAT,
	customer_name				  VARCHAR(30),
	CONSTRAINT invoice_PK PRIMARY KEY (invoice_id,invoice_dish_id),
	CONSTRAINT restaurant_id_FK FOREIGN KEY (restaurant_id) REFERENCES Chain_Location(restaurant_id),
	CONSTRAINT invoice_dish_id_FK FOREIGN KEY (invoice_dish_id) REFERENCES Menu (dish_id),
	CONSTRAINT service_provider_socialnumber_FK FOREIGN KEY (service_provider_socialnumber) REFERENCES Employee (social_number)
);

--eof:li000769-Assignment02-DDL.sql