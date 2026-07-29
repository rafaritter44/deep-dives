select e.*,
       coalesce(d.d_no, 0)                 as d_no,
       coalesce(d.d_name, 'No department') as d_name
from employee e
natural left join employee_department ed
natural left join department d;