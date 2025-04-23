8- during weekends which city has highest total spend to total no of transcations ratio 

select top 1 city , sum(amount)*1.0/count(1) as ratio
from credit_card
where datepart(weekday,transaction_date) in (1,7)
--where datename(weekday,transaction_date) in ('Saturday','Sunday')
group by city
order by ratio desc;

output: 
| City    | Ratio               |
|---------|---------------------|
| Sonepur | 299905.000000000000 |
