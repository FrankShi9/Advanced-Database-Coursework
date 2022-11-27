-- generate transaction info with each detailed receipt
create or replace view transaction_info as
select *
from ItemsInTransactions natural join Transactions 
;

-- union all of the transaction information
create or replace view all_amount_union as
    select name, l_id, date, amount
    from ItemsBroughtIntoShop
union
    select name, l_id, date, (-amount) as amount
    from transaction_info
union
    select name, from_l_id as l_id, date, (-amount) as amount
    from MovementOfItems
union
    select name, to_l_id as l_id, date,
        (amount) as amount
    from MovementOfItems
order by l_id, name, date;

-- sum all the transaction according to the exact name/l_id/date
create or replace view sum_all_amount as
select all_amount_union.name, all_amount_union.l_id, all_amount_union.date , sum(all_amount_union.amount)
from all_amount_union
group by all_amount_union.name, all_amount_union.l_id, all_amount_union.date;

-- generate all distinct l_id
create or replace view distinct_l_id as
select distinct l_id as l_id
from sum_all_amount;

-- generate all distinct date
create or replace view distinct_date as
select distinct date as date
from sum_all_amount;

-- generate all distinct name
create or replace view distinct_name as
select distinct name as name
from sum_all_amount;

-- generate all of the combination of name/l_id/date
create or replace view all_combination as
select distinct_name.name as name, distinct_l_id.l_id as l_id, distinct_date.date as date, (0) as amount
from distinct_name, distinct_l_id, distinct_date;

-- generate items, which the date does not exist in the specific name and l_id (optional choice)
create or replace view missing_date as
select distinct sum_all_amount.name as name, sum_all_amount.l_id as l_id, all_combination.date as date, (0) as amount
from sum_all_amount, all_combination
where sum_all_amount.name = all_combination.name and sum_all_amount.l_id = all_combination.l_id and sum_all_amount.date <> all_combination.date
group by sum_all_amount.name, sum_all_amount.l_id, all_combination.date;

-- union missing part with existing part
create or replace view all_raw_data as
    select *
    from all_combination
UNION
    select *
    from sum_all_amount
order by name,l_id, date;

-- accumulate based on attirbutes (not work right now)
-- create or replace view intermediate_result as
-- select t1.name,t1.l_id, t1.date, sum(t2.amount) as amount
-- from all_raw_data t1
--     inner join all_raw_data t2 on t2.date <= t1.date
-- group by t1.name, t1.l_id, t1.date
-- order by t1.name, t1.l_id,t1.date;

-- accumulate based on attributes (may work version)
create or replace view intermediate_result as
select t2.name, t2.l_id, t2.date,
    (select sum(amount)
    from all_raw_data t1
    where t1.name=t2.name and t1.l_id=t2.l_id and t1.date<=t2.date)
as amount
from all_raw_data as t2
order by t2.name, t2.l_id, t2.date;

-- filter all zero amount
create or replace view ItemsOnDateAndLocation as
select distinct *
from intermediate_result t
where t.amount <>0;


-- question 6
create or replace view tmp_FeasibleLocations as
    select distinct l_id, 1 as feasible
    from ItemsOnDateAndLocation
union
    select distinct l_id, 0 as feasible
    from ItemsOnDateAndLocation
    where l_id = any (select l_id
    from ItemsOnDateAndLocation
    where ItemsOnDateAndLocation.amount <0
    group by l_id);

create or replace view FeasibleLocations as
select distinct l_id, min(feasible)
from tmp_FeasibleLocations
group by l_id
order by l_id;

SELECT *
FROM FeasibleLocations;