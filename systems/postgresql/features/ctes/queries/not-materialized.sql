with w as not materialized (
    select * from big_table
)
select * from w as w1 join w as w2 on w1.key = w2.ref
where w2.key = 123;