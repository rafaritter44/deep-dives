UPDATE products
  FOR PORTION OF valid_at FROM '2023-09-01' TO '2025-03-01'
  SET price = 12.00
  WHERE product_no = 5;
