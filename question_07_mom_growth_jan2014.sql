7- which card and expense type combination saw highest month over month growth in Jan-2014

WITH a AS (
  SELECT card_type, exp_type, YEAR(transaction_date) AS yea,
         MONTH(transaction_date) AS mon, SUM(amount) AS amount 
  FROM credit_card
  GROUP BY card_type, exp_type, YEAR(transaction_date), MONTH(transaction_date)
), 
b AS (
  SELECT *, 
         ROW_NUMBER() OVER (PARTITION BY card_type, exp_type ORDER BY yea, mon) AS rn,
         LAG(amount,1) OVER (PARTITION BY card_type, exp_type ORDER BY yea, mon) AS pv
  FROM a
), 
c AS (
  SELECT *, 
         ((amount - pv) * 100.0) / pv AS pr 
  FROM b 
) 
SELECT * FROM c
WHERE yea = 2014 AND mon = 1
ORDER BY pr DESC;

output: 
| Card_Type | Exp_Type | Yea | Mon | Amount   | RN | PV      | PR (%)            |
|-----------|----------|-----|-----|----------|----|---------|--------------------|
| Gold      | Travel   | 2014| 1   | 2092554  | 4  | 1113534 | 87.920081470345    |
| Platinum  | Grocery  | 2014| 1   | 12256343 | 4  | 7757562 | 57.992201673670    |
