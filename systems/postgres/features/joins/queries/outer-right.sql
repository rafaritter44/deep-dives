select d.*,
       coalesce(e.e_no, 0)               as e_no,
       coalesce(e.e_name, 'No employee') as e_name,
       coalesce(e.manager_no, 0)         as manager_no
from employee e
natural right join employee_department
natural right join department d;