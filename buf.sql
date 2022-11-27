create or replace view test as
select * from ItemsInTransactions natural join Transactions;


create or replace view buf as
select `name`, l_id, `date`, amount from ItemsBroughtIntoShop
union 
select `name`, l_id, `date`, (-amount)as amount from test
union 
select `name`, from_l_id, `date`, (-amount)as amount from MovementOfItems
union
select `name`, to_l_id, `date`, (amount)as amount from MovementOfItems
order by l_id, `name`, `date`;

select * from buf;

create or replace view buf1 as
select `name`, l_id, `date`, (select sum(amount) from buf where `name`=b.`name` and l_id=b.l_id and `date`<=b.`date`) as amount from buf as b;

select * from buf1 where amount <> 0
order by `name`, l_id, `date`;

create or replace view dates as
select distinct `date` from buf1;

create or replace view shuffle as
select * from (select distinct l_id from buf1) as l_id, dates;

create or replace view datex as
select distinct shuffle.l_id, shuffle.`date` from shuffle, buf1 where shuffle.l_id=buf1.l_id and shuffle.`date` <> buf1.`date`;

create or replace view buf2 as
select distinct datex.`date`, `name`, buf1.l_id, (0) as amount from
datex, buf1 where datex.`date` <> buf1.`date` and datex.l_id=buf1.l_id;

-- 

create or replace view buf3 as
select `name`, l_id, `date`, amount from buf2
order by `name`, l_id, `date`;

create or replace view buf4 as
select * from  buf
union
select * from buf3;

create or replace view buf5 as
select `name`, l_id, `date`, (select sum(amount) from buf4 where `name`=b.`name` and l_id=b.l_id and `date`<=b.`date`) as amount from buf4 as b;

create or replace view buf6 as
select distinct `date`, `name`, l_id, amount from buf5;

create or replace view buf7 as
select `name`, l_id, `date`, amount from buf6;

create or replace view buf8 as
select * from buf7 order by `name`, l_id, `date`;

-- Q6 debug
-- select * from buf8 where l_id in (2, 3);
