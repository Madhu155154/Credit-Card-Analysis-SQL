# 💳 Credit Card Transaction Analysis (SQL Project)

This SQL project explores a fictional dataset of credit card transactions to derive insights into user spending behavior across Indian cities, card types, genders, and expense categories. Through structured queries, the project answers multiple real-world business questions using SQL.

---

### 📌 Problem Statement

In today’s digital economy, credit card usage is a key indicator of consumer behavior. Financial institutions and analysts need to extract meaningful insights from transaction data to:

- Identify spending patterns across cities and genders
- Evaluate card performance by type (Gold, Silver, etc.)
- Optimize marketing for high-growth categories
- Detect low-performance regions or services

This project uses SQL to analyze a dataset of **2,653 anonymized credit card transactions** and answers **10+ business questions** through data exploration and query design.

---

### 🎯 Project Goals

- Determine which cities and expense types drive the most credit card revenue
- Identify peak spending months for each card type
- Analyze female spending patterns by category
- Detect high-growth card-expense combinations
- Discover geographic and demographic trends in spending behavior

---

### 🧾 Dataset Description

The dataset contains **2,653 rows** and **7 columns**, assumed to be extracted from a transaction system.

| Column Name       | Description                                  |
|-------------------|----------------------------------------------|
| transaction_id    | Unique transaction ID                        |
| city              | City of the transaction                      |
| transaction_date  | Date when the transaction occurred           |
| card_type         | Type of credit card used                     |
| exp_type          | Category of expense (Fuel, Food, Bills...)   |
| gender            | Gender of the cardholder                     |
| amount            | Transaction amount                           |

**Sample Row:**

| transaction_id | city  | transaction_date | card_type | exp_type | gender | amount |
|----------------|-------|------------------|-----------|----------|--------|--------|
| 1              | Delhi | 29-Oct-14        | Gold      | Bills    | F      | 82475  |

---

### 📥 Data Import Process

The dataset `credit_card_transaction.csv` was imported into SQL Server using the **Import Wizard** in SQL Server Management Studio (SSMS).

**Steps:**
1. Open SSMS → Connect to your SQL Server instance
2. Right-click your database → **Tasks** → **Import Flat File**
3. Select the `.csv` file and follow the prompts
4. Ensure column data types are mapped correctly (e.g., `amount` as `BIGINT`)
5. Rename the imported table to `credit_card`

---

### 📌 Key Insights

- **Delhi, Mumbai, and Bangalore** are the top-spending cities.
- **Bills and Fuel** are the highest-value expense categories.
- **Female cardholders** contribute significantly to **Food** and **Grocery** spends.
- In **January 2014**, **Travel expenses** on **Gold cards** saw the highest month-over-month growth.
- **Sonepur** had the highest weekend spend-to-transaction ratio among all cities.

---
### 📁 Folder Structure

| File Name                             | Description                                                                 |
|--------------------------------------|-----------------------------------------------------------------------------|
| `create_database.sql`                | Creates and selects the credit_card database                               |
| `question_01_top_spend_cities.sql`   | Top 5 cities by total spend and their percentage contribution               |
| `question_02_highest_month.sql`      | Identifies the highest spend month for each card type                      |
| `question_03_cumulative_million.sql` | Finds the transaction where each card type's cumulative spend reaches 1M   |
| `question_04_lowest_gold_city.sql`   | Finds the city with the lowest % spend for Gold card                       |
| `question_05_high_low_expense.sql`   | Prints city-wise highest and lowest expense types                          |
| `question_06_female_spend_pct.sql`   | Shows percentage contribution of female spending for each expense type     |
| `question_07_mom_growth_jan2014.sql` | Finds card-expense pair with highest MoM growth in Jan 2014                |
| `question_08_weekend_ratio_v1.sql`   | Calculates weekend spend-to-transaction ratio using weekday numbers        |
| `question_09_weekend_ratio_v2.sql`   | Alternative weekend ratio calculation using weekday names                  |
| `question_10_fast_500_transactions.sql` | Identifies the city that reached 500 transactions the fastest              |


---

### ✅ How to Run

1. Clone the repository
2. Open `.sql` files in SSMS or Azure Data Studio
3. Make sure the `credit_card` table is created and populated
4. Run each query file separately to view results

---

### 🙋‍♂️ Author

**Madhu K**  
Business Analyst | SQL Developer | Power BI Enthusiast

📬 [LinkedIn](#)  
🌐 [Portfolio Website](#) *(optional)*


