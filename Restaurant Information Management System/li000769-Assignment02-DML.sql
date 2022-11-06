--Name:Boyu Li
--Student Number:041003345
--Section Num:302
--Semester:Level 1
--FileName:li000769-Assignment02-DML.sql
--Description:Write SQL code to add data to all the tables

--- minimum one range or check constraint ---
alter table invoice add constraint amount check(amount between 1 and 10000);

--Add data to the table chain_location
INSERT INTO Chain_Location(territory,city,restaurant_id) VALUES ('ON','Ottawa','ONO');
INSERT INTO Chain_Location(territory,city,restaurant_id) VALUES ('BC','Vancouver','BCV');
INSERT INTO Chain_Location(territory,city,restaurant_id) VALUES ('NS','Halifax','NSH');
INSERT INTO Chain_Location(territory,city,restaurant_id) VALUES ('AB','Calgary','ABC');
INSERT INTO Chain_Location(territory,city,restaurant_id) VALUES ('SK','Regina','SKR');
INSERT INTO Chain_Location(territory,city,restaurant_id) VALUES ('PE','Charlottetown','PEC');

--Add data to the table dish_category
INSERT INTO dish_category(category_id,category) VALUES (215,'Drinks');
INSERT INTO dish_category(category_id,category) VALUES (476,'Soup');
INSERT INTO dish_category(category_id,category) VALUES (199,'Pizza');
INSERT INTO dish_category(category_id,category) VALUES (418,'Roast');
INSERT INTO dish_category(category_id,category) VALUES (364,'Pasta');

--Add data to the table employee
SELECT * FROM  employee;
INSERT INTO employee(name,social_number) VALUES ('Alishba Cottrell',404750002);
INSERT INTO employee(name,social_number) VALUES ('Eli Wolf',619926918);
INSERT INTO employee(name,social_number) VALUES ('Lorcan Melendez',691634596);
INSERT INTO employee(name,social_number) VALUES ('Vinay Rice',400037883);
INSERT INTO employee(name,social_number) VALUES ('Sadiyah Cantrell',694223397);

--Add data to the table Menu
INSERT INTO menu(category_id,dish,dish_id) VALUES (215,'Apple juice',1938);
INSERT INTO menu(category_id,dish,dish_id) VALUES (215,'Bramble cocktail',5697);
INSERT INTO menu(category_id,dish,dish_id) VALUES (476,'Minestrone soup',1925);
INSERT INTO menu(category_id,dish,dish_id) VALUES (476,'Tomato soup',5400);
INSERT INTO menu(category_id,dish,dish_id) VALUES (199,'Quick grilled pizza',3522);
INSERT INTO menu(category_id,dish,dish_id) VALUES (199,'Easy spelt pizza',1573);
INSERT INTO menu(category_id,dish,dish_id) VALUES (418,'Perfect roast beef',4063);
INSERT INTO menu(category_id,dish,dish_id) VALUES (418,'House roast chicken',6188);
INSERT INTO menu(category_id,dish,dish_id) VALUES (364,'Tomato spaghetti',2859);
INSERT INTO menu(category_id,dish,dish_id) VALUES (364,'Honeymoon spaghetti',4996);

--Add data to the table invoice
INSERT INTO invoice(invoice_id,invoice_date,restaurant_id,invoice_dish_id,service_provider_socialnumber,amount,customer_name)
VALUES (446698474,'2022-4-3','ONO',4063,'404750002',19.9,'Wallace Horton');
INSERT INTO invoice(invoice_id,invoice_date,restaurant_id,invoice_dish_id,service_provider_socialnumber,amount,customer_name)
VALUES (286854074,'2022-4-2','BCV',1938,'619926918',9.9,'Ty Cope');
INSERT INTO invoice(invoice_id,invoice_date,restaurant_id,invoice_dish_id,service_provider_socialnumber,amount,customer_name)
VALUES (990938407,'2022-4-1','NSH',1573,'691634596',21.9,'Dannielle Chamberlain');
INSERT INTO invoice(invoice_id,invoice_date,restaurant_id,invoice_dish_id,service_provider_socialnumber,amount,customer_name)
VALUES (149170238,'2022-3-27','SKR',5400,'400037883',11.9,'Beatriz Whyte');
INSERT INTO invoice(invoice_id,invoice_date,restaurant_id,invoice_dish_id,service_provider_socialnumber,amount,customer_name)
VALUES (479810882,'2022-4-8','ONO',4063,'694223397',19.9,'Virginia Ponce');
INSERT INTO invoice(invoice_id,invoice_date,restaurant_id,invoice_dish_id,service_provider_socialnumber,amount,customer_name)
VALUES (479810882,'2022-4-8','ONO',3522,'694223397',15.9,'Virginia Ponce');

--- select where statement---
select invoice_id, restaurant_id, amount from invoice;
select * from Chain_Location where territory = 'BC';
select * from menu where category_id = '418' and dish_id = '4063';


---left outer joins: to list the restaurant not contained in the invoice table---
select chain_location.restaurant_id from chain_location left join
invoice on (chain_location.restaurant_id=invoice.restaurant_id);

--- right outer joins: to list the dish that not contained in the invoice table---
select invoice.invoice_dish_id from invoice right join menu on (invoice.invoice_dish_id =menu.dish_id);

---subqueries: to list the amount in the invoice table greater than average amount---
select * from invoice where amount > (select AVG(amount) from invoice);

---Union query---
select restaurant_id from chain_location union select restaurant_id from invoice;

--- metadata created---
select column_name,data_type,character_maximum_length from INFORMATION_SCHEMA.COLUMNS WHERE
TABLE_NAME  = 'chain_location' OR
TABLE_NAME = 'dish_category' OR
TABLE_NAME = 'employee' OR
TABLE_NAME = 'invoice' OR
TABLE_NAME = 'menu';
SELECT * FROM chain_location

--eof:li000769-Assignment02-DML.sql