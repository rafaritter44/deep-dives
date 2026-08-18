with moved_row as (
    delete from product
    where
        "date" >= '2010-10-01' and
        "date" <  '2010-11-01'
    returning *
)
insert into product_log
select * from moved_row
returning *;