DELETE FROM products
  FOR PORTION OF valid_at FROM '2021-08-01' TO '2023-09-01'
  WHERE product_no = 5;
