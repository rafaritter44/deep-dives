select id,
       coalesce(description, short_description, '(none)') as result
from item;