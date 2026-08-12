with regional_sales as (
    select   region, sum(amount) as total_sales
    from     "order"
    group by region
), top_region as (
    select region
    from   regional_sales
    where  total_sales > (select sum(total_sales)/10 from regional_sales)
)
select   region,
         product,
         sum(quantity) as product_units,
         sum(amount)   as product_sales
from     "order"
where    region in (select region from top_region)
group by region, product;