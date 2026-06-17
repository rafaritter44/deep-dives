-- Range Partitioning
create table "order" (
    id          bigserial,
    customer_id bigint         not null,
    amount      numeric(10, 2) not null,
    status      text           not null,
    created_at  timestamptz    not null
) partition by range (created_at);
create index order_id_idx on "order" (id);
create index order_customer_id_idx on "order" (customer_id);
create index order_created_at_idx on "order" (created_at);
create table order_2026_01
    partition of "order"
    for values from ('2026-01-01') to ('2026-02-01');
create table order_2026_02
    partition of "order"
    for values from ('2026-02-01') to ('2026-03-01');
create table order_2026_03
    partition of "order"
    for values from ('2026-03-01') to ('2026-04-01');

-- List Partitioning
create table customer (
    id     bigserial,
    name   text not null,
    region text not null
) partition by list (region);
create index customer_region_idx on customer (region);
create table customer_us
    partition of customer
    for values in ('US', 'CA');
create table customer_eu
    partition of customer
    for values in ('DE', 'FR', 'GB', 'NL');
create table customer_apac
    partition of customer
    for values in ('AU', 'JP', 'SG', 'IN');