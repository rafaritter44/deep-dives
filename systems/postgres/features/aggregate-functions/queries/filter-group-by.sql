select coalesce(str, 'None')           as str,
       count(*)                        as unfiltered,
       count(*) filter (where num > 0) as filtered
from test
group by str;