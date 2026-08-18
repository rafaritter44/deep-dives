select *
from employee
where e_no = some (select distinct manager_no from employee);