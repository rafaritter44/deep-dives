-- SELECT in WITH
create table "order" (
    id       bigserial,
    region   text,
    product  text,
    quantity integer,
    amount   numeric(10,2)
);

-- Recursive queries
create table part (
    part     text,
    subpart  text,
    quantity integer,
    primary key (part, subpart)
)