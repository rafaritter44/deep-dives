with recursive t(n) as (
    values (1)
  union all
    select n+1 from t where n < 100
)
select sum(n) from t;