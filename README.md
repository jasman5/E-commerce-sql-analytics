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

| Column
