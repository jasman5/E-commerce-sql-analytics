---1 dataset
SELECT * FROM `e-commerce-509805.e_commerce.user_events` LIMIT 1000;

--2 define sales funnel and the different stages
WITH funnel_stages AS (
  SELECT
    COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS stage_1_views,
    COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart,
    COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
    COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS stage_5_purchase

  FROM `e-commerce-509805.e_commerce.user_events`

WHERE event_date >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 356 DAY))
)

SELECT * FROM funnel_stages;

-- 3 conversion rates through funnel 

WITH funnel_stages AS (
  SELECT
    COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS stage_1_views,
    COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart,
    COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
    COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS stage_5_purchase

  FROM `e-commerce-509805.e_commerce.user_events`

  -- WHERE event_date >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 356 DAY))
)

SELECT 
  stage_1_views,
  stage_2_cart,
  ROUND(stage_2_cart*100/stage_1_views, 1)   AS views_to_cart_rate,
  stage_3_checkout,
  ROUND(stage_3_checkout*100/stage_2_cart, 1)    AS cart_to_checkout_rate,
  stage_4_payment,
  ROUND(stage_4_payment*100/stage_3_checkout, 1) AS checkout_to_payment_rate,
  stage_5_purchase,
  ROUND(stage_5_purchase*100/stage_4_payment, 1) AS payment_to_purchase_rate,
  ROUND(stage_5_purchase*100/stage_1_views, 1)   AS overall_conversion_rate
FROM funnel_stages;


--4 funnel by source

WITH source_funnel AS (
  SELECT
    traffic_source,
    COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS views,
    COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS cart,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchase

  FROM `e-commerce-509805.e_commerce.user_events`
  
  -- WHERE event_date >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 356 DAY))
  GROUP BY traffic_source
)

SELECT
  traffic_source,
  views,
  cart,
  purchase,
  ROUND(cart * 100 / views, 1) AS cart_conversion_rate,
  ROUND(purchase * 100 / views, 1) AS purchase_conversion_rate,
  ROUND(purchase * 100 / cart, 1) AS cart_to_purchase_conversion_rate
FROM source_funnel
ORDER BY purchase DESC;

--5 Time to conversion analysis

WITH user_journey AS (
  SELECT
    user_id,
    MIN(CASE WHEN event_type = 'page_view' THEN event_date END) AS view_time,
    MIN(CASE WHEN event_type = 'add_to_cart' THEN event_date END) AS cart_time,
    MIN(CASE WHEN event_type = 'purchase' THEN event_date END) AS purchase_time

  FROM `e-commerce-509805.e_commerce.user_events`

  -- WHERE event_date >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 356 DAY))
  GROUP BY user_id
  HAVING MIN(CASE WHEN event_type = 'purchase' THEN event_date END) IS NOT NULL
)

SELECT
  COUNT(*) AS converted_users,
  ROUND(AVG(TIMESTAMP_DIFF(cart_time, view_time, MINUTE)), 2) AS avg_view_to_cart_mins,
  ROUND(AVG(TIMESTAMP_DIFF(purchase_time, cart_time, MINUTE)), 2) AS avg_cart_to_purchase_mins,
  ROUND(AVG(TIMESTAMP_DIFF(purchase_time, view_time, MINUTE)), 2) AS avg_total_journey_mins
FROM user_journey;

--- 6 revenue funnel analysis

WITH funnel_revenue AS (
  SELECT
    COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS total_visitors,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS total_buyers,
    SUM(CASE WHEN event_type = 'purchase' THEN amount END) AS total_revenue,
    COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) AS total_orders

  FROM `e-commerce-509805.e_commerce.user_events`

  WHERE event_date >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 300 DAY))
)

SELECT
  total_visitors,
  total_buyers,
  total_orders,
  ROUND(total_revenue, 2) AS total_revenue,
  ROUND(total_revenue / total_orders, 2) AS avg_order_value,
  ROUND(total_revenue / total_buyers, 2) AS revenue_per_buyer,
  ROUND(total_revenue / total_visitors, 2) AS revenue_per_visitor
FROM funnel_revenue;