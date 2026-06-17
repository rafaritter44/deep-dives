-- Range Partitioning
insert into "order" (customer_id, amount, status, created_at)
values (12, 19.99, 'delivered', '2026-01-15 10:30:00+00'),
       (144, 9.99, 'shipped', '2026-02-21 11:35:00+00'),
       (7, 199.99, 'pending', '2026-03-07 07:00:00+00');

-- List Partitioning
insert into customer (name, region)
values ('Alice',   'US'),
       ('Bob',     'FR'),
       ('Charlie', 'JP');

-- Hash Partitioning
