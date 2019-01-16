drop table backrecord;
drop table outrecord;
drop table apprecord;
drop table motorcar;
drop table driver_zh;
drop table user_zh;
//记录调度人员的个人信息和操作权限

create table user_zh(
id		number primary key,
nickname	varchar2(20) unique not null,
password 	varchar2(200) not null,
name		varchar2(20) not null,
identitycard 	varchar2(20) unique not null,
passwdquestion varchar2(50) not null,
passwdanswer	varchar2(50) not null,
gender		varchar2(1) not null,
age		number	,
address 	varchar2(50) not null,
phone		varchar2(20) not null,
power		number default 0,
isonline 	number default 0,
icon		varchar2(100)
);


//驾驶人员信息表
create table driver_zh(
id 		number primary key,
name		varchar2(20) not null,
gender 		varchar2(1) not null,
age		number not null,
educationlevel varchar2(20) ,
position	varchar2(20),
licensenum	varchar2(20) unique not null,
cartype		varchar2(20) not null,
address		varchar2(50) not null,
phone		varchar2(20) not null,
descripe	varchar2(100) 
);
 
//记录车辆的详细信息
create table motorcar(
id		number primary key,
carnumber	varchar2(20) unique not null,
cartype		varchar2(20) not null,
capacity	number	not null,
driverid	number not null,
registerdate	varchar2(20)	not null,
status		varchar2(10),
descripe	varchar2(100),
constraint driver_id foreign key(driverid) references driver_zh(id)
);

//记录用车申请记录的详细信息
create table apprecord(
id		number primary key,
userid		number not null,
appdate		varchar2(20) not null,
res_address	varchar2(50) not null,
des_address	varchar2(50) not null,
capacity		number not null,
predictday	number,
customer	varchar2(20) not null,
phone 		varchar2(20) not null,
status		number default 0,
auditorid	number,
constraint userid_fk foreign key(userid) references user_zh(id),
constraint auditorid_fk foreign key(auditorid) references user_zh(id)
);

//出车明细
create table outrecord(
id		number primary key,
userid		number not null,
outdate		varchar2(20) not null,
carid		number not null,
appid		number not null,
status		number default 0,
constraint outrecord_uerid_fk foreign key(userid) references user_zh(id),
constraint outrecord_carid_fk foreign key(carid) references motorcar(id),
constraint outrecord_appid_fk foreign key(appid) references apprecord(id)
);

//返车明细
create table backrecord(
outid		number	primary key,
backdate 	varchar2(20) not null,
day		number,
cost		number,
constraint backrecord_fk foreign key(outid) references outrecord(id)
);

drop sequence KINDY_SEQ;
create sequence KINDY_SEQ increment by 1 start with 100000;


update user_zh set isonline=0 where nickname='kindy';
commit;
update user_zh set power=2 where nickname='kindy';
commit;