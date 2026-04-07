select coalesce(string_agg(str, ', '), 'None')
from test
group by str;