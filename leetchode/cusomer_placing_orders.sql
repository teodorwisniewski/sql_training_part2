
WITH max_counts AS (
  SELECT MAX(t.orders_count) max_counts
  FROM (
    SELECT customer_number, 
        COUNT(*) as orders_count
    FROM Orders
    GROUP BY customer_number
  ) t
), order_counts AS (
  SELECT customer_number, 
        COUNT(*) as orders_count
  FROM Orders
  GROUP BY customer_number
)


# SELECT *
# FROM max_counts

# SELECT customer_number, 
#         COUNT(*) as orders_count
#     FROM Orders
#     GROUP BY customer_number


SELECT customer_number
FROM order_counts
WHERE orders_count IN (
  SELECT max_counts
  FROM max_counts
)
