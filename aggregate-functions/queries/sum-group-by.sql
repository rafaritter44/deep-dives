select coalesce(str, 'None') as str,
       sum(id)               as id_sum,
       sum(num)              as num_sum
from test
group by str;