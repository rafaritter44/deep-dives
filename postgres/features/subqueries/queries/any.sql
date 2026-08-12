select *
from employee
where e_no = any (select distinct manager_no from employee);