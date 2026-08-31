use playstoredb;
select * from apps;
-- level-0-- 
-- 1. Add a foreign key from Apps.DeveloperID to Developers.DeveloperID.--
 alter table apps 
 add constraint fk_developer
 foreign key (developer_id)
 references developers(developerid);
 
 select* from apps;
 select*from developers;
-- 2. Add a foreign key from Apps.PublisherID to Publishers.PublisherID. --
alter table apps 
add constraint fk_publihsers
foreign key (publisher_id)
references publishers(publisher_id);

-- 3. Add a foreign key from Apps.CategoryID to Categories.CategoryID.
alter table apps
add constraint fk_category
foreign key (category_id)
references categories(category_id);
select * from categories;
 
-- 4. Display applications having a rating greater than 4.5. --
select app_name from apps where rating>4.5;

-- 5. Display applications whose price is equal to 0. --
select app_name from apps where price=0;

-- 6. Display applications belonging to CategoryID = 305. --
select app_name from apps where category_id=305;

-- level-1-- 

-- 1. Display applications with downloads greater than 500000000. --
select app_name from apps where downloads>500000000;
-- 2. Display applications having a rating between 4.3 and 4.7. --
select app_name from apps where rating between 4.3 and 4.7;

-- 3. Display applications whose price is either 0 or 299 using IN. --
select app_name from apps where price in(0,229);

-- 4. Display applications whose names start with G using LIKE. --
select app_name from apps where app_name like 'g%';

-- 5. Display applications whose names contain the word Google. --
select app_name from apps where app_name like '%google%';

-- 6. Display applications having a rating greater than 4.0 AND downloads greater than 500000000. --
select app_name from apps where rating>4.0 and downloads>500000000;

--  7. Display applications belonging to CategoryID = 301 OR CategoryID = 305.--
select app_name from apps where category_id=301 or category_id=305;



-- level-2-- 
-- 1. Display applications whose names do not start with G. --
select app_name from apps where app_name not like'g%';

-- 2. Display applications with ratings less than 4.5 or downloads greater than 1000000000. --
select app_name from apps where rating<4.5 and downloads>1000000000;

-- 3. Display developers whose names contain the letter a. --
select app_name from apps where app_name like'%a%';

-- 4. Display applications with prices between 0 and 300. --
select app_name from apps where price between 0 and 300;

-- 5. Display applications whose PublisherID is either 201 or 204. --
select app_name from apps where publisher_id=201 or publisher_id=204;

-- 6. Attempt to insert an application with a DeveloperID that does not exist in the Developers table and observe the effect of the foreign key. --
insert into apps
values(1012,'snapchat',106,203,305,4.5,100000000,0.00);
delete from apps where app_id=1012;
-- 7. Display all applications whose CategoryID is not 305.--
select app_name from apps where category_id=305;