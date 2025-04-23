 6- write a query to find percentage contribution of spends by females for each expense type

with a as (
select exp_type, sum(cast(amount as bigint)) as amount 
from credit_card
where gender = 'f'
group by exp_type
) 
select *, 
(amount * 100.0) / SUM(amount) OVER () as per
from a 

  
output: 


| Exp_Type     | Amount     | Per                     |
|--------------|------------|--------------------------|
| Entertainment| 358663333  | 16.263616701722114       |
| Food         | 452817279  | 20.533034698511438       |
| Bills        | 580035469  | 26.301753408452321       |
| Fuel         | 392282421  | 17.788076859163036       |
| Travel       | 55865530   | 2.533226798398591        |
| Grocery      | 365646998  | 16.580291533752497       |
