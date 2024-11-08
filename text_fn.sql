create database DBmidt;
use DBmidt;
show databases;

create table agents(agent_code char(6) primary key not null, agent_name char(40),
 working_area char(35), commission decimal(10,2), phone_no char(15),country varchar(25));
 
 create table customer(cust_code varchar(6) primary key not null, cust_name varchar(40) not null, cust_city varchar(35), working_area varchar(35) not null,
 cust_country varchar(20) not null, grade int, opening_amt decimal(12,2) not null, receive_amt decimal(12,2) not null,
 payment_smt decimal(12,2) not null, outstanding_amt decimal(12,2) not null, phone_no varchar(17) not null, agent_code char(6) not null,
 foreign key(agent_code) references agents(agent_code));
 
 create table orders(ord_num int primary key not null, ord_amount decimal(12,2) not null, advance_amount decimal(12,2) not null, ord_date date not null,
 cust_code varchar(6) not null, agent_code char(6) not null, ord_description varchar(60)not null, foreign key(cust_code) references customer(cust_code),
 foreign key(agent_code) references agents(agent_code));
 
desc agents;
desc customer;
desc orders;

insert into agents(agent_code, agent_name, working_area, commission, phone_no) value('A007', 'Ramasunder', 'Bangalore', '0.15', '077-25814763');
insert into agents(agent_code, agent_name, working_area, commission, phone_no) value('A003', 'Alex', 'London', '0.13', '075-12458969');
insert into agents(agent_code, agent_name, working_area, commission, phone_no) value('A008', 'Alford', 'New York', '0.12', '044-25874365');
insert into agents(agent_code, agent_name, working_area, commission, phone_no) value('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644');
insert into agents(agent_code, agent_name, working_area, commission, phone_no) value('A005', 'Anderson', 'Brisban', '0.13', '045-21447739');
insert into agents(agent_code, agent_name, working_area, commission, phone_no) value('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674');
insert into agents(agent_code, agent_name, working_area, commission, phone_no) value('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964');
insert into agents(agent_code, agent_name, working_area, commission, phone_no) value('A006', 'McDen', 'London', '0.15', '078-22255588');
insert into agents(agent_code, agent_name, working_area, commission, phone_no) value('A004', 'Ivan', 'Torento', '0.15', '008-22544166');
insert into agents(agent_code, agent_name, working_area, commission, phone_no) value('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178');




select agent_code as agent_id ,agent_name from agents order by agent_code desc;
select count(agent_code) as agent_count , working_area from agents group by working_area;
select agent_code , agent_name from agents where agent_name like 'A%'or agent_name like 'W%';

select agent_name from agents where phone_no = (select agent_code from agents
 where phone_no like '%8%');
 
 select agent_name from agents where commission = '0.15' or commission = '0.14' and phone_no like '%8%';

select * from agents where phone_no like '077%' or phone_no like '008%';

insert into customer(cust_code, cust_name, cust_city, working_area, cust_country, grade, opening_amt,
 receive_amt, payment_smt, outstanding_amt, phone_no, agent_code) value('C00013', 'Holmes', 'London', 'London', 
 'UK','2','6000.00','5000.00', '7000.00','4000.00','BBBBBBBB','A003');
 
 insert into customer(cust_code, cust_name, cust_city, working_area, cust_country, grade, opening_amt,
 receive_amt, payment_smt, outstanding_amt, phone_no, agent_code) value('C00001', 'Micheal', 'New York', 'New York', 
 'USA','2','3000.00','5000.00', '2000.00','6000.00','CCCCCCCC','A008');
 
 insert into customer(cust_code, cust_name, cust_city, working_area, cust_country, grade, opening_amt,
 receive_amt, payment_smt, outstanding_amt, phone_no, agent_code) value('C00020', 'Albert', 'New York', 'New York', 
 'USA','3','5000.00','7000.00', '6000.00','6000.00','BBBBBBBB','A008');
 
 insert into customer(cust_code, cust_name, cust_city, working_area, cust_country, grade, opening_amt,
 receive_amt, payment_smt, outstanding_amt, phone_no, agent_code) value('C00024', 'Cook', 'London', 'London', 
 'UK','2','4000.00','9000.00', '7000.00','6000.00','FSDDSDF','A006');

insert into customer(cust_code, cust_name, cust_city, working_area, cust_country, grade, opening_amt,
 receive_amt, payment_smt, outstanding_amt, phone_no, agent_code) value('C00015', 'Stuart', 'London', 'London', 
 'UK','1','6000.00','8000.00', '3000.00','11000.00','GFSGERS','A003');
 
 insert into customer(cust_code, cust_name, cust_city, working_area, cust_country, grade, opening_amt,
 receive_amt, payment_smt, outstanding_amt, phone_no, agent_code) value('C00002', 'Bolt', 'New York', 'New York', 
 'USA','3','5000.00','7000.00', '9000.00','3000.00','DDNRDRH','A008');


select cust_code, cust_name, cust_city 
from customer where agent_code = (select agent_code from agents where agent_name = 'Alford');


select cust_name, agent_name 
from customer c
join agents a
on a.agent_code = c.agent_code
join orders o 
on o.agent_code = a.agent_code
where ord_num in (select ord_num from orders where agent_code = 'A008');

select count(cust_code) as cust_count , agent_code from customer group by agent_code order by agent_code asc;

select count(cust_code) as cust_count, cust_city from customer group by cust_city;

select * from customer order by cust_code asc;

select cust_name from customer where grade > 1 and opening_amt > 3000 and receive_amt < 9000 and payment_smt > 3000 ;

alter table agents drop column country;

alter table customer drop column working_area;
drop table orders;
drop database DBmidt;

