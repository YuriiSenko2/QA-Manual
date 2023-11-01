# 1) create a database
create database mobile_device_manufacturers;

# 2) use the created database
use mobile_device_manufacturers;

# 3) create a table
create table companies_overview 
(id int not null auto_increment,  
company varchar (50) not null, 
foundation_year int null, 
headquarter varchar (50) null, 
annual_revenue int not null,
primary key (id));

# 4) fill in the table
insert into companies_overview (company,foundation_year,headquarter,annual_revenue) 
values ('Samsung', 1938, 'Seoul', 250),  
('Apple', 1976, 'California', 387),  
('Huawei', 1987, 'Shenzhen', 100),
('Nokia', 1865, 'Espoo', 22);

# 5) view the created table
select * from companies_overview;

# 6) rename a column
alter table companies_overview 
change company company_name varchar (50);

# 7) replace the value
update companies_overview 
set company_name = 'Samsung Electronics' 
where company_name = 'Samsung';

# 8) delete a columnn
alter table companies_overview 
drop column headquarter; 

# 9) add empty and populated with values columns 
alter table companies_overview 
add column country varchar (50) not null after foundation_year,
add column quality varchar (30) default 'Confirmed' not null;

# 10) fill the empty column with values
update companies_overview set country = 'South Korea' where company_name = 'Samsung Electronics';
update companies_overview set country = 'USA' where foundation_year = 1976;
update companies_overview set country = 'China' where annual_revenue = 100;
update companies_overview set country ='Finland' where id = 4;

# 11) add a new row to the table
insert into companies_overview (company_name,foundation_year,country,annual_revenue) 
values ('LG', 1947, 'South Korea', 65), 
('Dell', 1984, 'USA', 106);

# 12) change the column data type
alter table companies_overview 
modify quality char (30);

# 13) delete a row with a certain value
delete from companies_overview 
where company_name = 'Dell';