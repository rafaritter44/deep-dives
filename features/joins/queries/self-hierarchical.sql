select e.*,
       m.e_name as manager_name
from employee e
join employee m
    on  e.ein        = m.ein
    and e.manager_no = m.e_no;