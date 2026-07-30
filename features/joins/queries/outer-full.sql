select ein,
       coalesce(e_no, 0)                 as e_no,
       coalesce(e_name, 'No employee')   as e_name,
       coalesce(manager_no, 0)           as manager_no,
       coalesce(d_no, 0)                 as d_no,
       coalesce(d_name, 'No department') as d_name
from employee
natural full join employee_department
natural full join department;