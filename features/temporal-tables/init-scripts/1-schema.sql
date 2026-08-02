CREATE TABLE products (
    product_no integer,
    price numeric,
    valid_at daterange,
    PRIMARY KEY (product_no, valid_at WITHOUT OVERLAPS)
    -- UNIQUE (product_no, valid_at WITHOUT OVERLAPS)
);

CREATE TABLE variants (
  id         integer,
  product_no integer,
  name       text,
  valid_at   daterange,
  PRIMARY KEY (id, valid_at WITHOUT OVERLAPS),
  FOREIGN KEY (product_no, PERIOD valid_at) REFERENCES products (product_no, PERIOD valid_at)
);