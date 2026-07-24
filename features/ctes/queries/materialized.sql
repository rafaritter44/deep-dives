with w as materialized (
    select key, very_expensive_function(val) as f from some_table
)
select * from w as w1 join w as w2 on w1.f = w2.f;