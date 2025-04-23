 4- write a query to find city which had lowest percentage spend for gold card type
with a as (
select city , sum(amount) as amount
from credit_card
where  card_type = 'Gold'
group by city
) 
select Top 1 *, (amount * 100.0) / SUM(amount) OVER () as per
from a 
order by (amount * 100.0) / SUM(amount) OVER () asc;


output: 

| City     | Amount | Per             |
|----------|--------|-----------------|
| Dhamtari | 1416   | 0.000143823579  |
