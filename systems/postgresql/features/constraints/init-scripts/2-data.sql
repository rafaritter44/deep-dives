-- Check Constraints
insert into product_1 (name, price, discounted_price)
values ('Crime and Punishment', 20.00, 9.99),
       ('King Lear',            10.00, 4.99),
       ('Meet the Witnesses',   15.00, 7.49);
insert into product_2 (name, price, discounted_price)
values ('Crime and Punishment', 20.00, 9.99),
       ('King Lear',            10.00, 4.99),
       ('Meet the Witnesses',   15.00, 7.49);

-- Exclusion Constraints
insert into circles (c)
values (circle(point(0, 0), 5)),
       (circle(point(5, 5), 2));
