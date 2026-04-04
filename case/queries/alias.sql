select a,
       case when a=1 then 'one'
            when a=2 then 'two'
            else 'other'
       end as result
from test;