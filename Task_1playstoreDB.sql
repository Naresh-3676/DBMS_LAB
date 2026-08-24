-- task-1-- 
create database playstoredb;
USE playstoredb;
CREATE TABLE developers
(developerID INT PRIMARY KEY,
developer_name VARCHAR(60) Not NUll,
country VARCHAR(60),
founded_year INT );
INSERT INTO developers
(developerID,developer_name,country,founded_year)
VALUES(101,'GoogleLLC','USA',1998),
	  (102,'Meta Platforms','USa',2006),
      (103,'Spotify AB','sweden',2006),
      (104,'Canva Pyt Ltd','austrialia',2012),
      (105,'BYJUs','india',2011);
SELECT * FROM developers;

CREATE TABLE publishers
(publisher_id VARCHAR(60) PRIMARY KEY,
publisher_name VARCHAR(60),
Head_office VARCHAR(60),
support_emain VARCHAR(60));
INSERT INTO publishers
VALUES(201,'google play','california','support@google.com'),
	  (202,'samsung Galaxy store','seoul','support@samsung.com'),
      (203,'Huawel appgallery','shenzhen','support@huawie.com'),
      (204,'amazon appsrtore','sattle','support@amazon.com');
      select * from publishers;
      
create table records
(category_id int primary key,
category_name varchar(40),
minimum_age int);
insert into records
values(301,'education',3),
	  (302,'productive',3),
      (303,'music',12),
      (304,'social',13),
      (305,'gaming',16);
select * from records;

create table apps
(app_id int primary key,
app_name varchar(60),
developer_id int,
publisher_id int,
category_id int,
rating decimal(2,1),
downliads int,
price decimal(6,2));
alter table apps
change downliads  downloads varchar(40);
alter table apps 
change price price decimal(6,2);
insert into apps
values(1001,'Google Classroom',101,201,301,4.6,500000,0),
      (1002,'Google Keep',101,201,302,4.5,10000000000,0),
      (1003,'instagram',102,201,304,4.4,5000000000000,0),
      (1004,'spotify',103,201,303,4.5,100000000000000,0),
      (1005,'canva',104,201,302,4.7,5000000000,0),
      (1006,'byjus',105,201,301,4.3,1000000000,299),
      (1007,'candy crush',102,204,305,4.6,1000000000,00),
      (1008,'temple run',104,203,305,4.2,5000000000,00);
select * from apps;

      
