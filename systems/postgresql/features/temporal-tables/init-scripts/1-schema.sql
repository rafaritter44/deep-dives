create table product (
    product_no integer,
    price      numeric,
    valid_at   daterange,
    primary key (product_no, valid_at without overlaps)
    -- unique (product_no, valid_at without overlaps)
);

create table variant (
  variant_id integer,
  product_no integer,
  name       text,
  valid_at   daterange,
  primary key (variant_id, valid_at without overlaps),
  foreign key (product_no, period valid_at) references product (product_no, period valid_at)
  -- foreign key (product_no, period valid_at) references product
);
