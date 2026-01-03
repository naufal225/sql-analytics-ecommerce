-- SCHEMA
-- ==========

customers(
  id INT PRIMARY KEY,
  name VARCHAR,
  email VARCHAR,
  country VARCHAR
);

orders(
  id INT PRIMARY KEY,
  customer_id INT,
  product VARCHAR,
  amount NUMERIC,
  created_at DATE
);