10- which city took least number of days to reach its 500th transaction after the first transaction 
in that city

with a as 
(
select transaction_id, city, transaction_date,  ROW_NUMBER() over(partition by city order by transaction_date )
as rn ,min(transaction_date) over(partition by city) as min_date
from credit_card
)
select top 1 *, datediff(day,min_date, transaction_date) as days_
from a 
where rn = 500
order by datediff(day,min_date, transaction_date) asc


output: 
| Transaction_ID | City      | Transaction_Date | RN  | Min_Date   | Days_ |
|----------------|-----------|------------------|-----|------------|--------|
| 9571           | Bengaluru | 2013-12-24       | 500 | 2013-10-04 | 81     |
