select coalesce(str, 'None') as str,
       round(avg(id), 2)     as id_avg,
       round(avg(num), 2)    as num_avg
from test
group by str;