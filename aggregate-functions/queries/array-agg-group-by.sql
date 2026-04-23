select coalesce(str, 'None') as str,
       array_agg(id)         as id_array,
       array_agg(num)        as num_array
from test
group by str;