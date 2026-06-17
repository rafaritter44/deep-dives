-- Range Partitioning
create table order (
    id          bigserial      primary key,
    customer_id bigint         not null,
    amount      numeric(10, 2) not null,
    status      text           not null,
    created_at  timestamptz    not null
) partition by range (created_at);
create index order_created_at_idx on order (created_at);
create table order_2026_01
    partition of order
    for values from ('2026-01-01') to ('2026-02-01');
create table order_2026_02
    partition of order
    for values from ('2026-02-01') to ('2026-03-01');
create table order_2026_03
    partition of order
    for values from ('2026-03-01') to ('2026-04-01');