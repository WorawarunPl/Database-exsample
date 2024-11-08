create database DBmidt2;
use DBmidt2;
show databases;

create table jobs(job_id int(9) unsigned auto_increment primary key not null,job_name varchar(50) not null ,job_title varchar(50) 
not null, min_salary int(10) not null, max_salary int(10) not null);
create table regions(region_id int(9) unsigned auto_increment primary key not null, region_name varchar(50) not null);
create table countries(country_id int(9) primary key not null, country_name varchar(50) not null,region_id int(9) 
unsigned auto_increment not null,foreign key(region_id) references regions(region_id));
create table locations(location_id int(9) primary key not null, street_address varchar(50) not null,
 postal_code int(5) not null, city varchar(50) not null, state_province varchar(50) not null,country_id int(9) not null
 ,foreign key(country_id) references countries(country_id));
create table departments(department_id int(9) primary key not null, department_name varchar(50) not null,
 location_id int(9) not null, foreign key(location_id) references locations(location_id));
create table employees(employee_id int(9) primary key not null, first_name varchar(50) not null, 
last_name varchar(50) not null, email varchar(50) not null, phone_number varchar(50) not null,
hire_date varchar(50) not null, salary int(10) not null, manager_id int(9), job_id int(9) unsigned auto_increment not null,
 department_id int(9) not null, foreign key(manager_id) references employees(employee_id) ,foreign key(job_id) references jobs(job_id)
 , foreign key(department_id) references departments(department_id));
create table dependents(dependent_id int(9) primary key not null, first_name varchar(50) not null, 
last_name varchar(50) not null, relationship varchar(50) not null, employee_id int(9) not null, 
foreign key(employee_id) references employees(employee_id));
-- check table structure


desc jobs;
desc regions;
desc countries;
desc locations;
desc departments;
desc employees;
desc dependents;
-- 
insert into jobs(job_name, job_title, min_salary, max_salary) value ('Employee','pen employee', 30000,100000);
insert into regions(region_name) value ('Asia');
insert into countries(country_id,country_name,region_id) value('1', 'Thailand',(select region_id from regions where region_name = 'Asia'));
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) value('1','Bankok-Nonthburi',
'11000','Nonthaburi','Nonthaburi',(select country_id from countries where country_name = 'Thailand'));
insert into departments(department_id, department_name, location_id) value ('1', 'finance'
,(select location_id from locations where postal_code = '11000'));
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, salary, manager_id, job_id,
 department_id) value('1','Worawarun','Pliansri','worawaranpl@gmail','0954241048','2024-30-1','50000',null,
 (select job_id from jobs where job_title='pen employee'),(select department_id from departments where department_name='finance'));
insert into dependents(dependent_id,first_name,last_name,relationship, employee_id) value('1','Nong','Khem','Single'
,(select employee_id from employees where employee_id ='2'));
-- select
select * from jobs;
select * from regions;
select * from countries;
select * from locations;
select * from departments;
select * from employees;
select * from dependents;
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, salary, manager_id, job_id, 
department_id) value('2','Khem',
'Za','khemzaa@gmail','0954241048','2024-30-1','50000','1',(select job_id from jobs where job_title='pen employee'),
(select department_id from departments where department_name='finance'));
