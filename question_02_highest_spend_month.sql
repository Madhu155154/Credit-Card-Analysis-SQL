2 Write a query to print the highest spend month and amount spent in that month for each card type

with cte as (
select card_type,datepart(year,transaction_date) yt
,datepart(month,transaction_date) mt,sum(amount) as total_spend
from credit_card
group by card_type,datepart(year,transaction_date),datepart(month,transaction_date)
--order by card_type,total_spend desc
)
select * from (select *, rank() over(partition by card_type order by total_spend desc) as rn
from cte) a where rn=1


output: 

| Card Type | YT   | MT | Total Spend | RN |
|-----------|------|----|-------------|----|
| Gold      | 2015 | 1  | 55455064    | 1  |
| Platinum  | 2014 | 8  | 57936507    | 1  |
| Signature | 2013 | 12 | 58799522    | 1  |
| Silver    | 2015 | 3  | 59723549    | 1  |

