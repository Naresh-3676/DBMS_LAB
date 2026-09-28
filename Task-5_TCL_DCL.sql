use playstoredb;
-- Task-5 --
-- level-0 --
-- 1. Update the rating of Google Keep and permanently save the change using COMMIT.-- 
update apps set rating=4.8 where app_name="Google Keep";
commit;
select * from apps;
-- 2. Update the price of BYJU'S Learning and cancel the change using ROLLBACK. --
update apps set price=0.00 where app_name="byjus";
rollback;
-- 3. Insert a new application and use COMMIT to permanently save the record. --
insert into apps 
values(1015,'figma',105,201,302,4.6,10000000,0.00);
rollback;
select * from apps;
-- 4. Insert a new developer and use ROLLBACK to cancel the insertion. --
insert into developers
values(107,'techcrop','UAS',2007);
rollback;
-- 5. Create a savepoint after updating an application's rating. --
update apps set rating=4.5 where app_name='Google Keep';
savepoint after_rating_update;

select * from apps;
delete from apps
where app_id=1014;
-- level-1 --
-- 1. Update the ratings of two applications and create a savepoint between the updates. --
update apps set rating=4.6 where app_id=1012;
update apps set rating=4.5 where app_id=1013;
savepoint updates;
-- 2. Perform another update and use ROLLBACK TO SAVEPOINT to undo only the changes after the savepoint. --
update apps set rating=4.5 where app_id=1012;
rollback to savepoint updates ;
commit;
-- 3. Insert a new application, create a savepoint, update its price, and roll back to the savepoint. --
insert into apps
values(1014,'deepseek',106,204,303,4.6,105500000,0.00);
savepoint inserted;
update apps set price=99.99 where app_id=1014;

rollback to savepoint inserted;
commit;
select @@autocommit;
set autocommit=0;
-- 4. Grant SELECT privilege on the Apps table to a database user. --
create user 'user'@'localhost'
identified by 'user123';
grant select 
on playstoredb.apps
to 'user'@'localhost';
-- 5. Grant SELECT and INSERT privileges on the Apps table to a database user. --
grant select,insert  
on playstoredb.apps
to 'user'@'localhost';
-- 6. Revoke the INSERT privilege from the user. --
revoke insert
on playstoredb.apps
from 'user'@'localhost';

-- level 2 --
-- 1. Perform multiple updates on the Apps table and use SAVEPOINT and ROLLBACK TO to selectively undo changes. --

update apps set downloads=100000000 where app_id=1001;
update apps set rating=4.6 where app_id=1003;
savepoint multiple_updates;
rollback to savepoint multiple_updates;
commit;

-- 2. Insert two records into the Categories table, create a savepoint, and then roll back to the savepoint. --
select * from categories;
insert into categories
values(307,'Fun',6),
	  (308,'maths',5);
savepoint categories;
rollback to savepoint categories;
commit;

-- 3. Grant SELECT, INSERT, and UPDATE privileges on the Apps table to a user. --
grant select,insert,update 
on playstoredb.apps
to 'user'@'localhost';
-- 4. Revoke the UPDATE privilege from the user. --
revoke update
on playstoredb.apps
from 'user'@'localhost';
-- 5. Grant SELECT privilege on the Developers table and revoke the same privilege. --
grant select 
on playstoredb.developers
to 'user'@'localhost';
revoke select 
on playstoredb.developers
from 'user'@'localhost';
-- 6. Perform a transaction containing multiple operations and permanently save the final changes using COMMIT. --
select * from categories;
delete from categories
where category_id=307 ;
delete from categories
where category_id=308 ;
commit;
-- 7. Verify the effect of COMMIT and ROLLBACK by displaying the affected records.--
insert into apps
values(1015,'figma',101,201,303,4.6,10000000,99.99);
commit;
select * from apps;
rollback;

