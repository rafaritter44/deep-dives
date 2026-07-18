create table "order" (
    id       bigserial,
    region   text,
    product  text,
    quantity integer,
    amount   numeric(10,2)
);