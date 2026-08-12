select coalesce(str, 'None') as str,
       count(*)              as row_count,
       count(id)             as id_count,
       count(str)            as str_count,
       count(num)            as num_count
from test
group by str;