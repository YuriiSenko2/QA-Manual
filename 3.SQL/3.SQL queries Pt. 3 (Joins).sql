# 1. companies_overview table
#+----+---------------------+-----------------+-------------+----------------+-----------+
#| id | company_name        | foundation_year | country     | annual_revenue | quality   |
#+----+---------------------+-----------------+-------------+----------------+-----------+
#|  1 | Samsung Electronics |            1938 | South Korea |            250 | Confirmed |
#|  2 | Apple               |            1976 | USA         |            387 | Confirmed |
#|  3 | Huawei              |            1987 | China       |            100 | Confirmed |
#|  4 | Nokia               |            1865 | Finland     |             22 | Confirmed |
#|  5 | LG                  |            1947 | South Korea |             65 | Confirmed |
#+----+---------------------+-----------------+-------------+----------------+-----------+
# 2. smartphone_models table
#+----+----------------+--------------+------------+
#| id | model_name     | release_year | company_id |
#+----+----------------+--------------+------------+
#|  1 | iPhone_11      |         2019 |          2 |
#|  2 | Galaxy_S21FE   |         2022 |          1 |
#|  3 | Galaxy_S23     |         2023 |          1 |
#|  4 | Mate_50_Pro    |         2022 |          3 |
#|  5 | iPhone_13      |         2021 |          2 |
#|  6 | Redmi_11_Prime |         2022 |          6 |
#|  7 | iPhone_10      |         2017 |          2 |
#|  8 | Desire_22_Pro  |         2022 |          7 |
#+----+----------------+--------------+------------+

# 1) Inner Join
# Display companies and models they released after 2020 using companies_overview.id and smartphone_models.company_id

select companies_overview.company_name, smartphone_models.model_name, smartphone_models.release_year
from companies_overview 
join smartphone_models 
on companies_overview.id=smartphone_models.company_id
where smartphone_models.release_year>2020;

# 2) Left Join
#Find out which company model information wasn't entered into a database using companies_overview.id and smartphone_models.company_id

select companies_overview.company_name, smartphone_models.model_name,smartphone_models.release_year
from companies_overview left join smartphone_models on companies_overview.id=smartphone_models.company_id;

# 3) Right Join
# Find out which model is without company information using companies_overview.id and smartphone_models.company_id

select smartphone_models.model_name,companies_overview.company_name 
from companies_overview right join smartphone_models on companies_overview.id=smartphone_models.company_id;

# 4) FULL Join using UNION operator
# Find models without company information and companies without model information using companies_overview.id and smartphone_models.company_id

select * from companies_overview left join smartphone_models on companies_overview.id=smartphone_models.company_id
union select * from companies_overview right join smartphone_models on companies_overview.id=smartphone_models.company_id;
