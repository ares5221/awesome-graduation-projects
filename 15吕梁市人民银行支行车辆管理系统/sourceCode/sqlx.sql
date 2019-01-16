DROP TABLE IF EXISTS  backrecord;
DROP TABLE IF EXISTS  outrecord;
DROP TABLE IF EXISTS  apprecord;
DROP TABLE IF EXISTS  motorcar;
DROP TABLE IF EXISTS  driver_zh;
DROP TABLE IF EXISTS  user_zh;

create table user_zh(
id		int(11) primary key,
nickname	varchar(20) unique not null,
password 	varchar(200) not null,
name		varchar(20) not null,
identitycard 	varchar(20) unique not null,
passwdquestion varchar(50) not null,
passwdanswer	varchar(50) not null,
gender		varchar(1) not null,
age		int(11)	,
address 	varchar(50) not null,
phone		varchar(20) not null,
power		int(11) default 0,
isonline 	int(11) default 0,
icon		varchar(100)
);


create table driver_zh(
id 		int(11) primary key,
name		varchar(20) not null,
gender 		varchar(1) not null,
age		int(11) not null,
educationlevel varchar(20) ,
position	varchar(20),
licensenum	varchar(20) unique not null,
cartype		varchar(20) not null,
address		varchar(50) not null,
phone		varchar(20) not null,
descripe	varchar(100) 
);
 
create table motorcar(
id		int(11) primary key,
carint	varchar(20) unique not null,
cartype		varchar(20) not null,
capacity 	int(11)	not null,
driverid	 int(11) not null,
registerdate	varchar(20)	not null,
status		varchar(10),
descripe	varchar(100),
constraint driver_id foreign key(driverid) references driver_zh(id)
);

create table apprecord(
id		int(11) primary key,
userid		int(11) not null,
appdate		varchar(20) not null,
res_address	varchar(50) not null,
des_address	varchar(50) not null,
capacity		int(11) not null,
predictday 	int(11),
customer	varchar(20) not null,
phone 		varchar(20) not null,
status		int(11) default 0,
auditorid	int(11),
constraint userid_fk foreign key(userid) references user_zh(id),
constraint auditorid_fk foreign key(auditorid) references user_zh(id)
);

create table outrecord(
id		int(11) primary key,
userid		int(11) not null,
outdate		varchar(20) not null,
carid		int(11) not null,
appid		int(11) not null,
status		int(11) default 0,
constraint outrecord_uerid_fk foreign key(userid) references user_zh(id),
constraint outrecord_carid_fk foreign key(carid) references motorcar(id),
constraint outrecord_appid_fk foreign key(appid) references apprecord(id)
);

create table backrecord(
outid		int(11)	primary key,
backdate 	varchar(20) not null,
day		int(11),
cost		int(11),
constraint backrecord_fk foreign key(outid) references outrecord(id)
);

