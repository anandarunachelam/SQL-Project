select sales_manager_id,
round(datediff(curdate(), date_of_birth)/365) as Age
from managers;

create table sql101.employee(
emp_id int primary key,
emp_name varchar(64),
emp_email varchar(64));

insert into employee
values(101,"Anand","anandva42@gmail.com"),
(102,"Alex","abc@bca.com");

insert into employee
values(2001,"za@za.com");

select * from employee;
create view quantity as
select * from sales where quantity_sold>1000 and product_id = 7001001;

select * from quantity;
select sum(quantity_sold) from quantity;

create view anand as
select sales_date, quantity_sold
from sales where product_id = 7001001;

show full columns from employee;

alter table employee
add mobile int;
select * from employee;


select * from employee;

set SQL_SAFE_UPDATES = 0;
update employee
set mobile = 123 where emp_id = 101;
set SQL_SAFE_UPDATES = 1;

create view bio_managers as
select distinct m.sales_manager_id, m.first_name, m.last_name 
from managers m left join sales S
on m.sales_manager_id = s.sales_manager_id
left join products P
on s.product_id = p.product_id
where p.product_name like '%bio%';

select * from bio_managers;

DELIMITER $$
CREATE PROCEDURE GET_PRODUCTS()
BEGIN
	SELECT product_id, product_name, product_category FROM PRODUCTS
    WHERE product_category <> "Yoghurt";
    END $$
DELIMITER ;

CALL GET_PRODUCTS;

DELIMITER $$
CREATE PROCEDURE ANS3(IN MONTH_NUM INT)
BEGIN
	SELECT SUM(quantity_sold) FROM SALES WHERE
    MONTH(sales_date) = MONTH_NUM;
    END $$
DELIMITER ;

call ANS3(5);

select p.product_category,
sum(s.quantity_sold * p.unit_list_price) as revenue
from sales as s left join products as p
on s.product_id = p.product_id
group by p.product_category
order by revenue desc;


select p.product_name, month(s.sales_date) as mth,
sum(quantity_sold) from sales as s left join products as p
on s.product_id = p.product_id
group by p.product_name, mth
having sum(quantity_sold) > 20000;

