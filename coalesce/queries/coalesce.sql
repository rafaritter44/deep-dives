select id,
       coalesce(description, short_description, '(none)')
from item;