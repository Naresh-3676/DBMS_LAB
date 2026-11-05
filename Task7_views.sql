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
#Level 0
create view Appsview as select * from Apps;
select * from Appsview;
create view App1 as select AppID,AppName,Rating,Price from Apps;
select * from App1;
create view App2 as select AppName,Rating from Apps where Rating>=4.5;
select * from App2;
create view FreeApps as select AppName,Price from Apps where Price=0;
select * from FreeApps;
show full tables where Table_type="VIEW";

#Level 2
create view  AppDev as select A.AppName,D.DeveloperName from Apps A join Developers D on A.DeveloperID=D.DeveloperID;
select * from AppDev;
create view AppPub as select A.AppName,P.PublisherName from Apps A join Publishers P on A.PublisherID=P.PublisherID;
select * from AppPub;
create view AppCat as select A.AppName,C.CategoryName from Apps A join Categories C on A.CategoryID=C.CategoryID;
select * from AppCat;
create view AppDevCoun as select A.AppName,D.DeveloperName,D.country from Apps A join Developers D on A.DeveloperID=D.DeveloperID;
select * from AppDevCoun;

create view AppCatCount as select C.CategoryName,count(*) as total_apps from Apps A join Categories C on A.CategoryID=C.CategoryID group by CategoryName;
select * from AppCatCount;
create view AppDevCount as select D.DeveloperName,count(*) as total_apps from Apps A inner join Developers D on A.DeveloperID=D.DeveloperID group by DeveloperName;
select * from AppDevCount;
create view AvgRating as select CategoryID,avg(Rating) as average_rating from Apps group by CategoryID;
select * from AvgRating;
create view AppDevRat as select A.AppName,D.DeveloperName,A.Rating from Apps A inner join Developers D on A.DeveloperID=D.DeveloperID where A.Rating>4.3;
select * from AppDevRat;
show create view AppDevRat;

#Level 3
create view AppCount as select C.CategoryName,count(*) as total_applications from Apps A inner join Categories C on A.CategoryID=C.CategoryID group by C.CategoryID;
select * from AppCount;
create view Devview as select D.DeveloperName,count(*) as total_applications from Apps A inner join Developers D on A.DeveloperID=D.DeveloperID group by D.DeveloperID having count(*)>1;
select * from Devview;
create view highlowrat as select C.CategoryName,A.Rating from Apps A inner join Categories C on A.CategoryID=C.CategoryID order by A.Rating desc;
select * from highlowrat;
create view DevAppView as select D.DeveloperName,count(*) as total_apps from Apps A inner join Developers D on A.DeveloperID=D.DeveloperID group by D.DeveloperID;
select * from DevAppView;
create view allview as select A.AppName,D.DeveloperName,P.PublisherName,C.CategoryName from Apps A inner join Developers  D on A.DeveloperID=D.DeveloperID inner join Publishers P on A.PublisherID=P.PublisherID inner join Categories C on A.CategoryID=C.CategoryID;
select * from allview;
create view highRat as select A.AppName,A.Rating,D.DeveloperName,C.CategoryName from Apps A inner join Developers D on A.DeveloperID=D.DeveloperID inner join Categories C on A.CategoryID=C.CategoryID where Rating=(select max(Rating) from Apps A);

create view Pubview as select P.PublisherName,count(*) as total_apps ,sum(A.Downloads) as total_downloads from Publishers P left join Apps A on A.PublisherID=P.PublisherID group by P.PublisherName;
select * from Pubview;
select total_downloads from Pubview where total_downloads is not null order by total_downloads;

create view updatable as  select AppID,Rating from Apps;
update updatable set Rating=6.9 where AppID=1002;
select * from updatable;
select * from Apps;
drop view AppDev;
select * from AppDev;



