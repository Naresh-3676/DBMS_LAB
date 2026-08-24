use playstoredb;

-- task-2--
-- level 0--   
select upper(developer_name) from developers;
select lower(developer_name) from developers;
select length(app_name) from apps;
select category_name,length(category_name) from records;
select current_date(),current_time();
select round(rating) from apps;

-- level-1-- 
select app_name,substring(app_name,1,5) from apps;
select concat(developer_name," ",country) from developers;
select round(rating) from apps;
select ceil(price) from apps;
select founded_year from developers;
select convert(downloads,char) from apps;

-- level-2 -- 
select upper(app_name),rating from apps;
select substring(category_name,1,3) from records;
select abs(price-200) from apps;
select developer_name,length(developer_name) from developers;
select cast(downloads as char) from apps;
select convert(downloads,char) from apps;
