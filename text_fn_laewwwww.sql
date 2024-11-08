create database sales;
use sales;
-- Q1
select customer_name as name from customers where customer_id = (
select customer_id from orders where order_id = 
(select order_id from payments order by amount desc limit 1));

select customer_name as name from customers c
join orders o 
on o.customer_id = c.customer_id
where order_id = (select order_id from payments 
order by amount desc limit 1);

select customer_name as name from customers c
join orders o 
on o.customer_id = c.customer_id
join payments p
on o.order_id = p.order_id
order by amount desc limit 1;

-- Q2
select product_name from products where product_id in(
select product_id from order_details 
group by product_id
having count(order_id) > 1);

select product_name from products p
join order_details od
on od.product_id = p.product_id
group by p.product_id;

-- Q3
select customer_name from customers c
join orders o on o.customer_id = c.customer_id
join order_details od on od.order_id = o.order_id
join products p on p.product_id = od.product_id
where p.product_id = (select product_id from products where
product_name ='Sugar - Brown');

-- Q4
-- join
select product_name from products p
join order_details od on od.product_id = p.product_id
join orders o on od.order_id = o.order_id
join customers c on o.customer_id = c.customer_id
where c.customer_id = (select customer_id from customers
where customer_id ='71-4595008');

-- subq
select product_name from products where product_id =(
select product_id from order_details where order_id = (
select order_id from orders where customer_id = (
select customer_id from customers where customer_id ='71-4595008')));

select product_id from order_details where order_id = (
select order_id from orders where customer_id = (
select customer_id from customers where customer_id ='71-4595008'));

select order_id from orders where customer_id = (
select customer_id from customers where customer_id ='71-4595008');

select customer_id from customers where customer_id ='71-4595008';

-- Q5

-- 
select customer_name from customers c
where order_count >=1 and customer_id in(select customer_id from orders where order_id in(select order_id
from order_details where product_id in(select product_id from products where unit_price > 50)));

-- subq
select customer_name from customers where customer_id in (
select customer_id from orders where order_id in (
select order_id from order_details where product_id in(
select product_id from products where unit_price > 50)));

select customer_id from orders where order_id = (
select order_id from order_details where product_id = (
select product_id from products where unit_price > 50));

select order_id from order_details where product_id = (
select product_id from products where unit_price > 50);

select product_id from products where unit_price > 50;

-- join
select customer_name from customers c 
join orders o on c.customer_id = o.customer_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where p.product_id in(select product_id from products
where unit_price > 50);

-- mix
select customer_name from customers c 
join orders o on c.customer_id = o.customer_id
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
where p.unit_price > 50;

-- Q6
select customer_name as name , count(pm.order_id) as total_orders ,
count(pm.amount) as total_payment from customers c
join orders o on c.customer_id = o.customer_id
join payments pm on o.order_id = pm.order_id
group by c.customer_id;


select customer_name ,count(pm.order_id) as total_orders , 
count(pm.amount) as total_payment from customers c where customer_id in(
select customer_id from orders o where order_id in(
select count(order_id) as total_orders , count(amount) as total_payment
from payments pm ));


select customer_id from orders where order_id in(
select count(order_id) as total_orders , count(amount) as total_payment
from payments);

select count(order_id) as total_orders , count(amount) as total_payment
from payments;

-- Q7
-- join
select customer_name as name ,o.order_id as ID,
pm.payment_method as Method from customers c 
join orders o on c.customer_id = o.customer_id
join payments pm on o.order_id = pm.order_id
where pm.amount > 100;

-- Q8
select customer_name as Name , pm.order_id as ID , pm.amount as total_payment
from customers c
join orders o on c.customer_id = o.customer_id
join payments pm on o.order_id = pm.order_id
where order_date > '2023-01-01';


