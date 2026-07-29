select *
from employee
join employee_department
    using (ein, e_no)
join department
    using (ein, d_no);