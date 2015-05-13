drop table USERS;

create table USERS (
username varchar(15) not null unique,
password varchar(40) not null,
salt varchar(15),
email varchar(40) not null,
firstName varchar(25) not null,
lastName varchar(40) not null,
address varchar(30) not null,
address2 varchar(20),
city varchar(20) not null,
state1 varchar(5) not null,
zipCode varchar(10) not null,
phone varchar(15),
secQuestion varchar(100) not null,
secAnswer varchar(20) not null,
userId int  generated always as identity(start with 1, increment by 1) primary key);

drop table PRODUCTS;

create table PRODUCTS (
description varchar(50) not null,
content varchar(500) not null,
feature1 varchar(200),
feature2 varchar(200),
feature3 varchar(200),
dimensions varchar(50),
paypalValue varchar(20),
price double not null,
productType varchar(20),
picture blob,
picType varchar(20),
id integer generated always as identity(start with 1, increment by 1) primary key);

insert into USERS (username,password,salt,email,firstName,lastName,address,
address2,city,state1,zipCode,phone,secQuestion,secAnswer) values
('admin', '8e27a6460a6a43f17b88253fec2a1ba8', '[B@8df23b', 'admin@admin.com', 'admin', 
'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'why arcades?', 'hobby');
