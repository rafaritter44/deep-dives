select e1.ein,
       e1.manager_no,
       e1.e_no   as e1_no,
       e1.e_name as e1_name,
       e2.e_no   as e2_no,
       e2.e_name as e2_name
from employee e1
join employee e2
    on  e1.ein        = e2.ein
    and e1.manager_no = e2.manager_no
    and e1.e_no       < e2.e_no;