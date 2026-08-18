select coalesce(str, 'None') as str,
       min(id)               as min_id,
       min(num)              as min_num
from test
group by str;