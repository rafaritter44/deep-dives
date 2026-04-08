select count(*) as unfiltered,
       count(*) filter (where num > 0) as filtered
from test;