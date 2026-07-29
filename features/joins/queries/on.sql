select e.*, d.d_no, d.d_name
from employee e
join employee_department ed
    on  e.ein  = ed.ein
    and e.e_no = ed.e_no
join department d
    on  ed.ein  = d.ein
    and ed.d_no = d.d_no;