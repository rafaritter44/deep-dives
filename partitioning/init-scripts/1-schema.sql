create table order (
    id          bigserial      primary key,
    customer_id bigint         not null,
    amount      numeric(10, 2) not null,
    status      text           not null,
    created_at  timestamptz    not null
) partition by range (created_at);

create index order_created_at_idx on order (created_at);