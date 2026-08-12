select *
from employee
where e_no not in (select distinct manager_no from employee);