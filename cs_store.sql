-- create database `CS_Store`;
-- use `CS_Store`;

-- Q1
-- create table Customers(
-- 	birth_day date,
--     first_name varchar(20),
--     last_name varchar(20),
--     c_id int,
--     constraint PK_Customers primary key(c_id)
-- );

-- create table Employees(
-- 	birth_day date,
--     first_name varchar(20),
--     last_name varchar(20),
--     e_id int,
--     constraint PK_Employees primary key(e_id)
-- );

-- create table Locations(
--     address varchar(20),
--     l_id int,
--     constraint PK_Locations primary key(l_id)
-- );

-- create table Transactions(
-- 	e_id int,
--     c_id int,
--     l_id int,
-- 	`date` date,
--     t_id int,
--     constraint PK_Transactions primary key(t_id),
--     constraint FK_Transactions_e_id foreign key(e_id) references Employees(e_id),
--     constraint FK_Transactions_c_id foreign key(c_id) references Customers(c_id),
--     constraint FK_Transactions_l_id foreign key(l_id) references Locations(l_id)
-- );

-- create table Items(
--     price_for_each int,
-- 	`name` varchar(20),
--     constraint PK_Items primary key(`name`)
-- );

-- create table ItemsBroughtIntoShop(
-- 	`name` varchar(20),
--     l_id int,
--     amount int,
-- 	`date` date,
--     constraint FK_ItemsBroughtIntoShop_name foreign key(`name`) references Items(`name`),
--     constraint FK_ItemsBroughtIntoShop_l_id foreign key(l_id) references Locations(l_id)
-- );

-- create table MovementOfItems(
-- 	`name` varchar(20),
--     from_l_id int,
--     to_l_id int,
--     amount int,
-- 	`date` date,
--     constraint FK_MovementOfItems_name foreign key(`name`) references Items(`name`),
--     constraint FK_MovementOfItems_from_l_id foreign key(from_l_id) references Locations(l_id),
--     constraint FK_MovementOfItems_to_l_id foreign key(to_l_id) references Locations(l_id)
-- );

-- create table ItemsInTransactions(
-- 	`name` varchar(20),
--     t_id int,
--     amount int,
--     constraint FK_ItemsInTransactions_name foreign key(`name`) references Items(`name`),
--     constraint FK_ItemsInTransactions_t_id foreign key(t_id) references Transactions(t_id)
-- );

-- Data about customers
-- INSERT INTO Customers VALUES('1983-02-11','Jamie','Johnson',1);
-- INSERT INTO Customers VALUES('1995-10-26','Birgit','Doe',2);
-- INSERT INTO Customers VALUES('1991-05-15','Finn','Smith',3);
-- INSERT INTO Customers VALUES('1990-07-03','Anita','Taylor',4);
-- Data about employees
-- INSERT INTO Employees VALUES('1964-12-01','Carla','Brown',1);
-- INSERT INTO Employees VALUES('1984-03-14','Bryan','Williams',2);
-- INSERT INTO Employees VALUES('1991-02-19','Finn','Wilson',3);
-- INSERT INTO Employees VALUES('1998-08-12','Denise','Davies',4);
-- Data about locations
-- INSERT INTO Locations VALUES('Park Road 7',1);
-- INSERT INTO Locations VALUES('Hill Street 2',2);
-- INSERT INTO Locations VALUES('Duckinfield Street 5',3);
-- Data about transactions
-- INSERT INTO Transactions VALUES(1,3,1,'2021-08-09',1);
-- INSERT INTO Transactions VALUES(4,2,2,'2021-08-14',2);
-- INSERT INTO Transactions VALUES(4,4,1,'2021-09-07',3);
-- INSERT INTO Transactions VALUES(3,4,1,'2021-09-07',4);
-- INSERT INTO Transactions VALUES(4,1,3,'2021-09-07',5);
-- INSERT INTO Transactions VALUES(1,4,1,'2021-09-23',6);
-- Data about items
-- INSERT INTO Items VALUES(200,'Bread');
-- INSERT INTO Items VALUES(100,'Lemonade');
-- INSERT INTO Items VALUES(100,'Banana');
-- INSERT INTO Items VALUES(200,'Rice');
-- INSERT INTO Items VALUES(150,'Grape');
-- INSERT INTO Items VALUES(450,'Chicken');
-- INSERT INTO Items VALUES(25,'Garlic');
-- Data about items brought into shop
-- INSERT INTO ItemsBroughtIntoShop VALUES('Bread',1,13,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-2-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-3-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-4-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-5-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-6-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-7-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-8-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-9-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-10-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Banana',1,5,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Rice',1,2,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Grape',1,99,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Chicken',1,2,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Garlic',1,1,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Bread',1,3,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Banana',2,7,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Rice',2,2,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Chicken',2,19,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Garlic',2,1,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Bread',3,5,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',3,5,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Banana',3,6,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Rice',3,8,'2021-1-1');
-- INSERT INTO ItemsBroughtIntoShop VALUES('Grape',3,10,'2021-1-1');


-- Data about movement of items
-- INSERT INTO MovementOfItems VALUES('Lemonade',1,3,20,'2021-6-1');
-- INSERT INTO MovementOfItems VALUES('Garlic',3,1,20,'2021-6-1');
-- INSERT INTO MovementOfItems VALUES('Banana',2,3,5,'2021-6-1');
-- INSERT INTO MovementOfItems VALUES('Banana',3,1,9,'2021-7-1');
-- INSERT INTO MovementOfItems VALUES('Banana',1,2,4,'2021-9-1');
-- INSERT INTO MovementOfItems VALUES('Grape',3,1,5,'2021-7-1');

-- Data about items in transactions
-- INSERT INTO ItemsInTransactions VALUES('Garlic',1,5);
-- INSERT INTO ItemsInTransactions VALUES('Bread',1,8);
-- INSERT INTO ItemsInTransactions VALUES('Chicken',1,1);
-- INSERT INTO ItemsInTransactions VALUES('Rice',1,1);
-- INSERT INTO ItemsInTransactions VALUES('Banana',2,3);
-- INSERT INTO ItemsInTransactions VALUES('Chicken',2,5);
-- INSERT INTO ItemsInTransactions VALUES('Rice',2,1);
-- INSERT INTO ItemsInTransactions VALUES('Rice',3,1);
-- INSERT INTO ItemsInTransactions VALUES('Chicken',3,1);
-- INSERT INTO ItemsInTransactions VALUES('Garlic',4,7);
-- INSERT INTO ItemsInTransactions VALUES('Grape',4,80);
-- INSERT INTO ItemsInTransactions VALUES('Lemonade',5,17);
-- INSERT INTO ItemsInTransactions VALUES('Grape',5,5);
-- INSERT INTO ItemsInTransactions VALUES('Lemonade',6,17);
-- INSERT INTO ItemsInTransactions VALUES('Grape',6,24);		




-- Q2

create or replace view DeniseTransactions as
select count(distinct Transactions.t_id) as number_of_transactions
from Employees natural join Transactions where (Employees.first_name = 'denise') and year(Transactions.`date`)=2021 and month(Transactions.`date`)=9;

select * from DeniseTransactions;

-- Q3

-- create or replace view PeopleInShop as
-- (SELECT distinct birth_day, first_name, last_name FROM 
-- Employees natural join Transactions where l_id = 1 and `date`='2021-09-07'
-- union 
-- SELECT distinct birth_day, first_name, last_name FROM Customers natural join Transactions 
-- where l_id = 1 and `date`='2021-09-07') order by birth_day;

-- select * from PeopleInShop;

-- Q4
-- create or replace view TransactionValue as
-- select t_id, sum(price_for_each*amount) as `value` from
-- Transactions natural join ItemsInTransactions natural join Items
-- group by t_id
-- order by t_id;

-- select * from TransactionValue;

-- Q5
-- v1, very poor
-- create or replace view ItemsAfterTransac as
-- 	select ItemsBroughtIntoShop.`name`, ItemsBroughtIntoShop.l_id, (-ItemsInTransactions.amount+ItemsBroughtIntoShop.amount)as amount, `date` from ItemsInTransactions 
--     natural join 
--     Transactions, ItemsBroughtIntoShop
--     where Transactions.l_id = ItemsBroughtIntoShop.l_id
--     group by ItemsInTransactions.`date`;
--     
-- create or replace view ItemsAfterMove as
-- 	select MovementOfItems.`name`, ItemsAfterTransac.l_id, (ItemsAfterTransac.amount-MovementOfItems.amount)as amount, `date` from ItemsAfterTransac, MovementOfItems
--     where ItemsAfterTransac.l_id = MovementOfItems.from_l_id
--     group by ItemsAfterTransac.`date`;
--     
-- create or replace view ItemsAfterMove2 as
-- 	select MovementOfItems.`name`, ItemsAfterMove.l_id, (ItemsAfterMove.amount+MovementOfItems.amount)as amount, `date` from ItemsAfterMove, MovementOfItems
--     where ItemsAfterMove.l_id = MovementOfItems.to_l_id
--     group by ItemsAfterMove.`date`;
--     
-- create or replace view ItemsOnDateAndLocation as
-- select `name`, l_id, `date` as `date`, amount from ItemsAfterMove2
-- group by `Date`
-- order by l_id, `Date`; 

-- -----------------------------------------------------------

-- v2 works for white box test cases

-- create or replace view ItemsOnDateAndLocation as
-- select * from buf8 where amount <> 0;

-- select * from ItemsOnDateAndLocation;

-- Q6
-- create or replace view FeasibleLocations as
-- select l_id, 1 as feasible from
--   ItemsOnDateAndLocation where 
-- 	ItemsOnDateAndLocation.amount >=0
-- union 
-- select l_id, 0 as feasible from
--   ItemsOnDateAndLocation where
-- 	ItemsOnDateAndLocation.amount < 0
-- group by l_id
-- order by l_id;

-- quick fix for both 0 and 1 appear in a group, works for white box test cases.
-- select l_id, min(feasible) from FeasibleLocations
-- group by l_id;

-- create or replace view FeasibleLocations0 as
-- select l_id, 1 as feasible from
--   ItemsOnDateAndLocation where 
-- 	ItemsOnDateAndLocation.amount >=0
-- union 
-- select l_id, 0 as feasible from
--   ItemsOnDateAndLocation where
-- 	ItemsOnDateAndLocation.amount < 0
-- group by l_id
-- order by l_id;

-- create or replace view FeasibleLocations as
-- select l_id, min(feasible) as feasible from FeasibleLocations0
-- group by l_id;

-- v2
-- create or replace view FeasibleLocations0 as
-- select l_id, 0 as feasible from ItemsOnDateAndLocation where l_id = any (select l_id from ItemsOnDateAndLocation where amount<0 group by l_id)
-- union 
-- select l_id, 1 as feasible from ItemsOnDateAndLocation 
-- group by l_id
-- order by l_id;


-- create or replace view FeasibleLocations as
-- select distinct l_id, min(feasible) from FeasibleLocations0
-- group by l_id
-- order by l_id;

-- select * from FeasibleLocations;

