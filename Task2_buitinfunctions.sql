use playstoredb;

-- task-2--
-- level 0-- 
-- 1. Display all developer names in uppercase. --
select upper(developer_name) from developers;

-- 2. Display all developer names in lowercase. --
select lower(developer_name) from developers;

-- 3. Display the length of each application name. --
select length(app_name) from apps;

-- 4. Display each category name along with its length. --
select category_name,length(category_name) from records;

-- 5. Display the current date and current time. --
select current_date(),current_time();

-- 6. Round the ratings of all applications to 0 decimal places.  --
select round(rating) from apps;

-- level-1-- 
-- 1. Display the application names along with their first 5 characters. --
select app_name,substring(app_name,1,5) from apps;

-- 2. Display the developer name and country together using CONCAT(). --
select concat(developer_name," ",country) from developers;

-- 3. Display the rating of each application using ROUND(). --
select round(rating) from apps;

-- 4. Display the price of each application after applying CEIL(). --
select ceil(price) from apps;

-- 5. Display the year in which each developer was founded. --
select founded_year from developers;

-- 6. Convert the Downloads value into a suitable character representation using a conversion function.-- 
select convert(downloads,char) from apps;

-- level-2 -- 
-- 1. Display each application name in uppercase along with its rating. --
select upper(app_name),rating from apps;

-- . Display the first 3 characters of each category name. --
select substring(category_name,1,3) from records;

-- 3. Display the absolute difference between the application price and 200. --
select abs(price-200) from apps;

-- 4. Display the developer name and its length. --
select developer_name,length(developer_name) from developers;

-- 5. Display the current date and current timestamp. --
select cast(downloads as char) from apps;

-- 6. Use CAST() or CONVERT() to convert a numeric value into a character value.--
select convert(downloads,char) from apps;
