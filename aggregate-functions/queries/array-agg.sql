select array_agg(id)  as id_array,
       array_agg(str) as str_array,
       array_agg(num) as num_array
from test;