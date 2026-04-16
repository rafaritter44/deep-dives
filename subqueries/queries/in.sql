select *
from employee
where e_no in (select distinct manager_no from employee);