drop table PRODUCTS;

create table PRODUCTS (
description varchar(50) not null,
content varchar(500) not null,
feature1 varchar(200),
feature2 varchar(200),
feature3 varchar(200),
demensions varchar(50),
paypalValue varchar(20),
price double not null,
productType varchar(20),
picture blob,
picType varchar(20),
id integer generated always as identity(start with 1, increment by 1) primary key);