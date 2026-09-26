# E-Commerce Customer Funnel & Revenue Analytics

An end-to-end **SQL and Google BigQuery analytics project** that analyzes e-commerce customer behavior, funnel conversion, traffic-source performance, customer journey time, and revenue metrics through an interactive dashboard.

---

## 📌 Project Overview

This project analyzes event-level e-commerce data to understand how customers move through the purchase journey — from their first website interaction to completing a purchase.

The analysis uses **SQL in Google BigQuery** to identify:

* Customer funnel progression and drop-offs
* Conversion rates between funnel stages
* Traffic source performance
* Customer journey duration
* Revenue and order metrics
* Overall business performance

The results are presented through an interactive analytics dashboard to make the findings easier to interpret and communicate.

---

## 🎯 Business Objective

The project aims to answer key business questions such as:

* How many users reach each stage of the purchase funnel?
* Where do customers drop off the most?
* What are the conversion rates between funnel stages?
* Which traffic sources bring the most visitors?
* Which traffic sources generate the most purchases?
* Which channels generate the most revenue?
* What is the overall visitor-to-purchase conversion rate?
* What is the average order value?
* How long does it take customers to complete their purchase journey?

---

## 🛒 Customer Funnel

The customer journey is analyzed across five major stages:

```text
Page View
    ↓
Add to Cart
    ↓
Checkout Start
    ↓
Payment Info
    ↓
Purchase
```

Distinct users are calculated at each stage to measure customer progression and identify potential conversion drop-offs.

---

## 📊 Dataset

The project uses an event-level e-commerce dataset containing customer interactions.

| Column           | Description                                  |
| ---------------- | -------------------------------------------- |
| `user_id`        | Unique identifier for each user              |
| `event_id`       | Unique identifier for each event             |
| `event_date`     | Date and time of the customer event          |
| `event_type`     | Type of customer interaction                 |
| `product_id`     | Product associated with the event            |
| `traffic_source` | Source through which the customer arrived    |
| `amount`         | Transaction amount associated with purchases |

### Event Types

The analysis primarily uses:

* `page_view`
* `add_to_cart`
* `checkout_start`
* `payment_info`
* `purchase`

---

## 🔍 Analysis Performed

### 1. Customer Funnel Analysis

Calculated the number of distinct users progressing through each stage:

* Page Views
* Add to Cart
* Checkout Start
* Payment Info
* Purchases

This helps identify where customers are being lost during the purchase journey.

---

### 2. Conversion Rate Analysis

Calculated conversion rates between each stage of the funnel:

* View → Cart Conversion Rate
* Cart → Checkout Conversion Rate
* Checkout → Payment Conversion Rate
* Payment → Purchase Conversion Rate
* Overall View → Purchase Conversion Rate

Example:

```sql
ROUND(
    SAFE_DIVIDE(stage_2_cart * 100, stage_1_views),
    1
) AS views_to_cart_rate
```

`SAFE_DIVIDE()` is used to prevent division-by-zero errors, while `ROUND()` keeps the output presentation-ready.

---

### 3. Traffic Source Analysis

Compared traffic sources based on customer activity and conversion performance.

Metrics include:

* Visitors
* Add-to-Cart Users
* Purchasers
* Cart Conversion Rate
* Purchase Conversion Rate
* Cart-to-Purchase Conversion Rate
* Revenue Performance

This analysis helps identify which acquisition channels generate customer activity and purchases.

---

### 4. Customer Journey Analysis

Analyzed the time taken by customers to progress through different stages of their purchase journey.

Metrics include:

* Average View → Cart Time
* Average Cart → Purchase Time
* Average Total Journey Time
* Number of Converted Users

SQL functions including `MIN()`, `TIMESTAMP_DIFF()`, `AVG()`, and conditional aggregation were used to calculate customer journey metrics.

---

### 5. Revenue Analysis

Calculated key revenue and business performance metrics:

* Total Visitors
* Total Buyers
* Total Orders
* Total Revenue
* Average Order Value
* Revenue per Buyer
* Revenue per Visitor

Revenue metrics are rounded to two decimal places for presentation.

---

## 📈 Dashboard

The SQL analysis was transformed into an interactive e-commerce analytics dashboard.

### Key Performance Indicators

* **Total Visitors**
* **Total Buyers**
* **Total Orders**
* **Total Revenue**
* **Average Order Value**
* **Overall Conversion Rate**

### Dashboard Visualizations

* Customer Funnel
* Funnel Conversion Rates
* Traffic Source Performance
* Revenue by Traffic Source
* Revenue Trends
* Customer Journey Analysis

---

## 🛠️ Tools & Technologies

| Tool                | Purpose                                    |
| ------------------- | ------------------------------------------ |
| **SQL**             | Data querying, transformation and analysis |
| **Google BigQuery** | Cloud data warehouse and SQL execution     |
| **Julius AI**       | Dashboard creation and data visualization  |
| **GitHub**          | Version control and project documentation  |

---

## 💡 Key Skills Demonstrated

* SQL
* Google BigQuery
* Data Analysis
* Customer Funnel Analysis
* Conversion Rate Analysis
* Revenue Analysis
* Customer Journey Analysis
* Traffic Source Analysis
* Common Table Expressions (CTEs)
* Conditional Aggregation
* `TIMESTAMP_DIFF()`
* `MIN()` / `AVG()`
* Data Visualization
* Business Analytics
* Business Insight Generation

---

## ❓ Key Business Questions Answered

1. How many users reach each stage of the purchase funnel?
2. Where does the largest customer drop-off occur?
3. What percentage of visitors eventually make a purchase?
4. Which traffic source brings the most visitors?
5. Which traffic source generates the most purchases?
6. Which channels generate the most revenue?
7. What is the average order value?
8. How much revenue is generated per buyer?
9. How much revenue is generated per visitor?
10. How long does the average customer journey take?

---

## 🚀 Future Improvements

Potential extensions to the project include:

* Product-level performance analysis
* Customer cohort analysis
* Customer retention analysis
* Repeat purchase analysis
* Customer segmentation
* Customer Lifetime Value (CLV) analysis
* Automated data refresh pipelines
* Direct BigQuery-to-dashboard integration
* Advanced time-series analysis
* Period-over-period performance comparison

---

## 📁 Project Structure

```text
E-commerce-sql-analytics/
│
├── dashboard/
│   └── Dashboard files
│
├── processed_data/
│   └── Processed datasets
│
├── raw_data/
│   └── Raw datasets
│
├── E_commerce_analysis/
│   └── SQL analysis queries
│
└── index.html
```

---

## 👩‍💻 Author

**Jasman Kaur**

Computer Engineering Student | Data Analytics | SQL | BigQuery | Data Visualization

---

## ⭐ Project Highlights

This project demonstrates the complete analytics workflow:

```text
Raw E-Commerce Data
        ↓
Data Exploration
        ↓
SQL Analysis
        ↓
Funnel & Conversion Analysis
        ↓
Revenue & Customer Journey Analysis
        ↓
Dashboard Visualization
        ↓
Business Insights
```
