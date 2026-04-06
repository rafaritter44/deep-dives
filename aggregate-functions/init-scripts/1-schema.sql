create table product (
    product_id bigserial primary key,
    name text,
    brand text,
    size char(1),
    price numeric(10, 2)
);

create table sale (
    sale_id bigserial primary key,
    product_id bigint references product,
    units integer
);

create view items_sold as
    select brand, size, sum(units) as sales
        from product p join sale s using (product_id)
        group by brand, size
        order by sales;