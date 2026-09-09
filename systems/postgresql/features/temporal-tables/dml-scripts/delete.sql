truncate table variant;

delete from product
  for portion of valid_at from '2021-08-01' to '2023-09-01'
  where product_no = 5;
