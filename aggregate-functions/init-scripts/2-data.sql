with new_product as (
    insert into product (name, brand, size, price)
    values ('T-Shirt', 'Foo', 'L', 12.50),
           ('T-Shirt', 'Bar', 'L', 12.00),
           ('T-Shirt', 'Bar', 'M', 9.50),
           ('Pants', 'Foo', 'L', 12.50)
    returning product_id
)
insert into sale (product_id, units)
select product_id, 5
from new_product;

with new_product as (
    insert into product (name, brand, size, price)
    values ('T-Shirt', 'Foo', 'M', 10.00),
           ('Pants', 'Foo', 'M', 10.00),
           ('Pants', 'Bar', 'M', 9.50)
    returning product_id
)
insert into sale (product_id, units)
select product_id, 10
from new_product;

insert into product (name, brand, size, price)
values ('Pants', 'Bar', 'L', 12.00),
       ('Pants', 'Baz', 'L', 17.50);