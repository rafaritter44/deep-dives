select e.*
from employee e
natural left join employee_department
natural left join department d
where d.d_no is null;