select coalesce(str, 'None') as str,
       max(id)               as max_id,
       max(num)              as max_num
from test
group by str;