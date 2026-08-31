use playstoredb;
-- level-0--
-- 1. Find the total number of applications in the Apps table. --
select count(*) from apps; 

-- 2. Find the average rating of all applications. --
select avg(rating) from apps;

-- 3. Find the highest application rating. --
select max(rating) from apps;

-- 4. Find the lowest application rating. --
select min(rating) from apps;

-- 5. Find the total number of downloads of all applications. --
select sum(downloads) from apps;

-- 6. Display all applications ordered by rating in descending order. --
select app_name,rating from apps order by rating desc;



-- level-1--

-- 1. Find the number of applications for each CategoryID. --
 select category_id,count(*) from apps group by category_id;
 
-- 2. Find the average rating for each CategoryID. --
select category_id,avg(rating) from apps group by category_id;

-- 3. Find the maximum and minimum price of applications. --
select min(price),max(price) from apps;

-- 4. Display applications ordered by downloads from highest to lowest. --
select app_name,downloads from apps order by downloads desc;

-- 5. Display the number of applications for each DeveloperID. --
select developer_id,count(*) from apps  group by developer_id;

-- 6. Display categories having more than one application using HAVING.--
select category_id,count(*) from apps group by category_id having count(*)>1;



-- level-2 --
-- 1. Find the total downloads for each DeveloperID. --
select developer_id,sum(downloads) from apps group by developer_id;

-- 2. Find the average rating for each PublisherID. --
select publisher_id,avg(rating) from apps group by publisher_id;

-- 3. Display developers having more than one application.-- 
select developer_id,count(*) from apps group by developer_id having count(*)>1;

-- 4. Display categories whose average rating is greater than 4.3. 
select category_id,avg(rating) from apps group by category_id having avg(rating)>4.3;

-- 5. Display the CategoryID and total number of applications, ordered by application count in descending order-- 
select category_id,count(*) from apps group by category_id order by count(*) desc;

-- 6. Find the highest-rated application in the Apps table using MAX() and a suitable subquery.  --
select max(rating) from apps;

-- 7. Display the total price of applications for each DeveloperID.  --
select developer_id ,sum(price) from apps group by developer_id;
  