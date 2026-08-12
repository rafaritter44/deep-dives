select *
from employee
where salary >= all (select salary from employee);