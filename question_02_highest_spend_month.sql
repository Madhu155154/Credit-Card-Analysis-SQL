2 Write a query to print the highest spend month and amount spent in that month for each card type

with a as (
select card_type, month(transaction_date) as month_ , amount,
case 
when card_type = 'Silver' then amount else null 
end as Silver,
case 
when card_type = 'Signature' then amount else null 
end as Signature,
case 
when card_type = 'Gold' then amount else null 
end as Gold,
case 
when card_type = 'Platinum' then amount else null 
end as Platinum
from credit_card
) 
select top 1 month_, sum(amount) as total_spend , sum(Silver) as Silver , 
sum(Signature) as Signature , sum(Gold) as Gold, 
sum(Platinum) as Platinum
from a 
group by month_
order by sum(amount) desc

output: 

| Month | Total Spend | Silver     | Signature  | Gold       | Platinum   |
|-------|-------------|------------|------------|------------|------------|
| 1     | 431209556   | 109359598  | 98919381   | 110146204  | 112784373  |
