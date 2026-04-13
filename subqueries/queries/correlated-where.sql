select *
from employee e
where salary > (select avg(salary)
                from employee
                where d_no = e.d_no);