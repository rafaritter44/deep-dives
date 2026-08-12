-- SELECT in WITH
create table "order" (
    id       bigserial primary key,
    region   text,
    product  text,
    quantity integer,
    amount   numeric(10, 2)
);

-- Data-modifying statements in WITH
create table product (
    id     bigserial primary key,
    name   text,
    price  numeric(10, 2),
    "date" date
);
create table product_log (
    id     bigint primary key,
    name   text,
    price  numeric(10, 2),
    "date" date
);

-- Recursive query
create table part (
    part     text,
    subpart  text,
    quantity integer,
    primary key (part, subpart)
);

-- Tree traversal
create table tree (
    id   integer primary key,
    link integer references tree,
    data text
);

-- Cycle detection
create table graph (
    id   integer primary key,
    link integer references graph,
    data text
);

-- Materialization
create table big_table (
    key integer primary key,
    ref integer references big_table
);