with recursive included_part(subpart, part, quantity) as (
    select subpart, part, quantity from part where part = 'our_product'
  union all
    select p.subpart, p.part, p.quantity * pr.quantity
    from   included_part pr, part p
    where  p.part = pr.subpart
)
select   subpart, sum(quantity) as total_quantity
from     included_part
group by subpart;