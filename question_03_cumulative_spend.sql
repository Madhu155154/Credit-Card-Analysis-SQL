--3- write a query to print the transaction details(all columns from the table) for each card type when
--it reaches a cumulative of  1,000,000 total spends(We should have 4 rows in the o/p one for each card type)


with a as (
select *,sum(amount) over(partition by card_type order by transaction_date,transaction_id) as total_spend
from credit_card_transcations
--order by card_type,total_spend desc
)
select * from (select *, rank() over(partition by card_type order by total_spend) as rn  
from a where total_spend >= 1000000) a where rn=1


output: 


| Transaction_ID | City      | Transaction_Date | Card_Type | Exp_Type | Gender | Amount | Total_Spend | RN |
|----------------|-----------|------------------|-----------|----------|--------|--------|--------------|----|
| 1522           | Delhi     | 2013-10-04       | Gold      | Food     | M      | 281924 | 1272624      | 1  |
| 191            | Ahmedabad | 2013-10-05       | Platinum  | Bills    | F      | 612572 | 1537482      | 1  |
| 73             | Delhi     | 2013-10-04       | Signature | Bills    | F      | 550782 | 1285819      | 1  |
| 7565           | Bengaluru | 2013-10-04       | Silver    | Food     | F      | 205179 | 1115582      | 1  |
