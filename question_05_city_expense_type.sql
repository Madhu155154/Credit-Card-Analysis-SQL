
5- write a query to print 3 columns:  city, highest_expense_type , 
lowest_expense_type (example format : Delhi , bills, Fuel)

with a as (
select city, exp_type, sum(amount) as amount
from credit_card
group by city, exp_type
)
select city, max(case when lowest=1 then exp_type end) as lowest_exp_type
, min(case when highest=1 then exp_type end) as highest_exp_type
from (
select *, 
 ROW_NUMBER() over( partition by city order by amount desc ) 
 as highest ,
 ROW_NUMBER() over( partition by city order by amount asc )  
as lowest, 
ROW_NUMBER() over( partition by city order by amount desc ) as h , 
ROW_NUMBER() over( partition by city order by amount asc ) as l
from a ) as b 
group by city


output: 

### Sample Output (Q5: City-wise Highest & Lowest Expense Type)

| City       | Highest_ | Lowest        |
|------------|----------|---------------|
| Achalpur   | Grocery  | Entertainment |
| Adilabad   | Bills    | Food          |
| Adityapur  | Food     | Grocery       |
| Adoni      | Bills    | Entertainment |
| Adoor      | Fuel     | Bills         |
| Afzalpur   | Fuel     | Food          |
| Agartala   | Grocery  | Food          |
| Agra       | Bills    | Grocery       |
| Ahmedabad  | Bills    | Grocery       |
| Ahmednagar | Fuel     | Grocery       |
