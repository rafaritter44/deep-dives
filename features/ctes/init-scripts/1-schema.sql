-- SELECT in WITH
create table "order" (
    id       bigserial,
    region   text,
    product  text,
    quantity integer,
    amount   numeric(10,2)
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
    link integer references tree(id),
    data text
);