-- create database sales;
use sales;
-- Q1 
alter table customers drop column order_count;

-- Q2 
alter table customers change column customer_name cus_name varchar(50);

-- Q3 
select * from customers where cus_name not like 'A%' and cus_name not like 'B%' and cus_name not like 'C%';

-- Q4 
select * from customers where customer_id like '%1%';

-- Q5 
select customer_id from orders order by order_date desc;

-- Q6 
select customer_id from orders order by order_date asc;

-- Q7 
alter table orders modify column order_date varchar(60);

-- Q8 
select count(product_id) as count from expired_products where expiration_date < '2024-01-01';
