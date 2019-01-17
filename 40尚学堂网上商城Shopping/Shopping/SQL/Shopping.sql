#数据库命名全部小写
create database shopping;

use shopping;

create table user 
(
id int primary key auto_increment,
username varchar(40),
password varchar(16),
phone varchar(40),
addr varchar(255),
rdate datetime
);

create table category
(
id int primary key auto_increment,
pid int, #pid为0的是最顶层节点
name varchar(255), 
descr varchar(255),
cno int, #最多三层, 每层占两位, 最多99个子节点
grade int #代表级别, 从1开始
);

create table product
(
id int primary key auto_increment,
name varchar(255),
descr varchar(255),
normalprice double,
memberprice double,
pdate datetime,
categoryid int references catetory(id)
);

create table salesorder
(
id int primary key auto_increment,
userid int,
addr varchar(255),
odate datetime,
status int
);

create table salesitem 
(
id int primary key auto_increment,
productid int, 
unitprice double, 
pcount int,
orderid int
);

#select pid, sum(pcount) sumCount from salesitem group by pid order by sumCount desc limit 0, 10 


