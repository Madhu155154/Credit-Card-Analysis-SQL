1- write a query to print top 5 cities with highest spends and their percentage contribution of 
-- total credit card spends 

with a as 
(
select city ,sum(cast(amount as bigint)) as spend 
--sum(amount) over() as total_amount
from credit_card
group by city
),
b as 
(
select *,
--spend*1.0 / sum(spend) over() as total_amount, 
(spend * 100.0) / SUM(spend) OVER () AS pct_share
from a
)
select top 5 *from b 
order by pct_share desc
