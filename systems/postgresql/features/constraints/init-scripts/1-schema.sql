-- Check Constraints
create table product_1 (
    product_no       bigserial,
    name             text,
    price            numeric check (price > 0),
    discounted_price numeric check (discounted_price > 0),
    check (price > discounted_price)
);
create table product_2 (
    product_no       bigserial,
    name             text,
    price            numeric constraint positive_price            check (price > 0),
    discounted_price numeric constraint positive_discounted_price check (discounted_price > 0),
    constraint valid_discount check (price > discounted_price)
);

-- Exclusion Constraints
create table circles (
    c circle,
    exclude using gist (c with &&)
)
