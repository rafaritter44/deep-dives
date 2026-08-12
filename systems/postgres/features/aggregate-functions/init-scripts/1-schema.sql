create table test (
    id bigserial primary key,
    str text,
    num integer
);

create table items_sold (
    brand text,
    size char(1),
    sales integer,
    primary key (brand, size)
)