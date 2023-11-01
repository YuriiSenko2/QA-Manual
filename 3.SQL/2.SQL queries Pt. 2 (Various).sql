#+----+---------------------+-----------------+-------------+----------------+-----------+
#| id | company_name        | foundation_year | country     | annual_revenue | quality   |
#+----+---------------------+-----------------+-------------+----------------+-----------+
#|  1 | Samsung Electronics |            1938 | South Korea |            250 | Confirmed |
#|  2 | Apple               |            1976 | USA         |            387 | Confirmed |
#|  3 | Huawei              |            1987 | China       |            100 | Confirmed |
#|  4 | Nokia               |            1865 | Finland     |             22 | Confirmed |
#|  5 | LG                  |            1947 | South Korea |             65 | Confirmed |
#+----+---------------------+-----------------+-------------+----------------+-----------+

# 1) Display companies with annual revenue above 200, ordered by the company with the highest revenue
select company_name, annual_revenue from companies_overview
where annual_revenue >= 200 
order by annual_revenue desc;

# 2) Display the number of companies in each country.
select count(company_name),country from companies_overview 
group by country;

# 3) Display the number of companies in countries where this figure above 1 
select count(company_name),country from companies_overview 
group by country 
having count(company_name) > 1;

# 4) Display the average annual revenue of South Korean companies
select avg(annual_revenue) from companies_overview 
where country = 'South Korea';

# 5) Display the total annual revenue of all companies 
select sum(annual_revenue) from companies_overview;

# 6) Display all records in the second to the fourth row
select * from companies_overview limit 3 offset 1;

# 7) Display all records where the company was founded after 1900 and its annual revenue below 150
select * from companies_overview 
where foundation_year > 1900 and annual_revenue < 150;
 
# 8) Display all records where the company is either from Finland or has an above 300 annual revenue figure
select * from companies_overview 
where country = 'Finland' or annual_revenue > 300;

# 9) Display all records where the Finnish or Chinese company has an above 99 annual revenue figure
select * from companies_overview 
where annual_revenue > 99 and (country = 'Finland' or country = 'China');

# 10) Display all companies founded between 1930 and 1950
select company_name from companies_overview 
where foundation_year between 1930 and 1950;

# 11) Display all companies not founded in 1947
select company_name from companies_overview 
where foundation_year not in (1947);

# 12) Display all records where the company name ends in "-le"
select * from companies_overview 
where company_name like '%le';

# 13) Display all records where the country name contains the letter "u"
select * from companies_overview 
where country like '%u%';
