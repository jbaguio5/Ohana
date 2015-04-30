Drop table USERS;
create table USERS (
username varchar(15) not null unique,
password varchar(15) not null,
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
userId int  generated always as identity(start with 1, increment by 1) primary key
);

INSERT INTO USERS (USERNAME, PASSWORD, EMAIL, FIRSTNAME, LASTNAME, 
ADDRESS, ADDRESS2, CITY, STATE1, ZIPCODE, PHONE, SECQUESTION, SECANSWER) VALUES 
('johndoe', 'password', 'johndoe@mail.com', 'John', 'Doe', 
'12345 General Drive', 'Apt. 12345', 'Austin', 'TX', '78727', '512-123-4567', 
'What'' the name of your dog?', 'Spot'),
('jilljack', 'password', 'jilljack@mail.com', 'Jill', 'Jack', 
'21 General Street', '', 'Dallas', 'TX', '75205', '', 
'What is you favorite Song?', 'MmmBop'),
('thenook', 'nook1', 'nook@gmail.com', 'Calvin', 'Baguio', 
'123 first st', '', 'Dallas', 'TX', '75205', '', 
'what is my name', 'Calvin');
