drop database PlaystoreDB;
#DataBase Creation statement

create database PlayStoreDB;
use PlayStoreDB;

#Table Creation Statement

create table Developers
(
DeveloperID int primary key,
DeveloperName varchar(60) not null,
Country varchar(30),
FoundedYear int
);

#Data Insertion Statements

insert into Developers(DeveloperID,DeveloperName,Country,FoundedYear)
values
(101,'Google LLC','USA',1998),
(102,'meta Platforms','USA',2004),
(103,'Spotify AB','Sweden',2006),
(104,'Canava Pyt Ltd','Australia',2012),
(105,"BYJU's",'India',2011);


create table Publishers



(
PublisherID int primary key,
publisherName varchar(60),
HeadOffice varchar(40),
SupportEmail varchar(60)
);
insert into Publishers
values
(201,'Google Pay','Califrnia','support@gmail.com'),
(202,'Samsung Galaxy Store','Seoul','support@gmail.com'),
(203,'Huawei AppGallery','Shenzhen','support@gmail.com'),
(204,'Amazon AppStore','Seattle','support@gmail.com');

  
create table Categories
(
CategoryID int primary key,
CategoryName varchar(40),
MinimumAge int
);
insert into Categories
values
(301,'Education',3),
(302,'Productivity',3),
(303,'Music',12),
(304,'Social',13),
(305,'Gaming',16);

create table Apps
(
AppID int primary key,
Appname varchar(60),
DeveloperID int ,
PublisherID int,
CategoryID int,
Rating decimal(2,1),
Downloads int,
Price decimal(6,2)
);
insert into Apps
values
(1001,'Google classromm',101,201,301,4.6,500000000,0),
(1002,'Google keep',101,201,302,4.5,1000000000,0),
(1003,'Instagram',102,201,304,4.4,500000000,0),
(1004,'Sportify',103,201,303,4.5,100000000,0),
(1005,'Canva',104,201,303,4.5,500000000,0),
(1006,"BYJU's Learning",105,201,301,4.3,1000000000,299),
(1007,'Candy Crush',102,204,305,4.2,5000000,0),
(1008,'Temple run',104,203,305,4.2,500000000,0);
select * from Apps;
select * from Developers;

#Level 0
select A.AppName,D.DeveloperName from Apps A inner join Developers D on A.DeveloperID=D.DeveloperID;
select A.AppName,P.PublisherName from Apps A inner Join Publishers P on A.PublisherID=P.PublisherID;
select A.AppName,C.CategoryName from Apps A inner join Categories C on A.CategoryID=C.CategoryID;
select A.AppName,D.DeveloperName,P.PublisherName from Apps A inner join Developers D on A.DeveloperID=D.DeveloperID inner join Publishers P on A.PublisherID=P.PublisherID;
select A.AppName,D.DeveloperName,C.CategoryName from Apps A inner join Developers D on A.DeveloperID=D.DeveloperID inner join Categories C on A.CategoryID=C.CategoryID;
select P.PublisherName,A.AppName from Publishers P left join Apps A on P.PublisherID=A.PublisherID;
select C.CategoryName,A.AppName from Categories C left join Apps A on C.CategoryID=A.CategoryID;
#Level 1
select P.PublisherName,A.AppName from Publishers P left join Apps A on P.PublisherID=A.PublisherID;
select P.PublisherName,A.AppName from  Publishers P right join Apps A on P.PublisherID=A.PublisherID;
select C.CategoryName,A.AppName from Categories C left join Apps A on C.CategoryID=A.CategoryID;
select A.AppName,D.DeveloperName,D.Country from Apps A   join Developers D on A.DeveloperID=D.DeveloperID;
select A.AppName,D.DeveloperName,P.PublisherName,C.CategoryName from Apps A join Developers D on A.DeveloperID=D.DeveloperID join Publishers P on A.PublisherID=P.PublisherID join Categories C on A.CategoryID=C.CategoryID;
select A.AppName,D.DeveloperName,D.country from Apps A join Developers D on A.DeveloperID=D.DeveloperID where D.country="USA";
select A.AppName,P.PublisherName,C.CategoryName from Apps A join Publishers P on A.PublisherID=P.PublisherID join Categories C on A.CategoryID=C.CategoryID where C.CategoryName="Gaming";
select A.AppName,D.DeveloperName,A.Rating from Apps A join Developers D on A.DeveloperID=D.DEveloperID where A.Rating>4.5;
#Level 2
select P.PublisherName,A.AppName from Publishers P left join Apps A on A.PublisherID=P.PublisherID;
select P.PublisherName,A.AppName from Publishers P left join Apps A on A.PublisherID=P.PublisherID where A.AppID is null;
select C.CategoryName ,A.AppName from Categories C left join Apps A on A.CategoryID=C.CategoryID order by CategoryName;
select A.AppName,D.DeveloperName,P.PublisherName,C.CategoryName,A.Rating from Apps A left join Developers D on A.DeveloperID=D.DeveloperID join Publishers P on A.PublisherID=P.PublisherID join Categories C on A.CategoryID=C.CategoryID;
select A.AppName,P.PublisherName,D.country from Apps A join Publishers P 
on A.PublisherID=P.PublisherID join Developers D on A.DeveloperID=D.DeveloperID
 where D.country="USA" and P.PublisherName="Google Pay";
 select D.DeveloperName,A.AppName from Developers D left join Apps A on A.DeveloperID=D.DeveloperID;
 select D1.DeveloperName as Developer1,D2.DeveloperName as Developer2 ,D1.country from Developers D1 join Developers D2 on D1.country=D2.country;
 select P.PublisherName,C.CategoryName from Publishers P cross join Categories C;
 select P.PublisherName,A.AppName from Publishers P left join Apps A on A.PublisherID=P.PublisherID union select P.PublisherName,A.AppName from Apps A right join Publishers P on A.PublisherID=P.PublisherID;
 select A.AppName,C.CategoryName,D.DeveloperName,P.PublisherName from Apps A inner join Categories C on A.CategoryID=C.CategoryID inner join Publishers P on A.PublisherID=P.PublisherID inner join Developers D on A.DeveloperID=D.DeveloperID where CategoryName in ("Gaming","Social");
 select A.AppName,D.DeveloperName,C.CategoryName,A.Rating from Apps A join Developers D on A.DeveloperID=D.DeveloperID join Categories C on A.CategoryID=C.CategoryID where A.Rating between 4.3 and 4.7;
 select D.DeveloperName,A.AppName,D.country from Developers D join Apps A on A.DeveloperID=D.DeveloperID where D.country!="India";