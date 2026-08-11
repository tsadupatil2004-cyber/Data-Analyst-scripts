create database mydb;
use mydb;

create table user (
rollno int ,
name varchar(10),
city varchar(10)
);

insert into user values(
(10,"Ram","kolhapur"),
(20,"Seeta","Nashik"),
(30,"Tanvi","Nagpur"),
(40,"Harshada","Pune"),
(50,"Priya","Mumbai")
);

select * from user;