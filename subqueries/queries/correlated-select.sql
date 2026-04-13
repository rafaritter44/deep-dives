select e_no,
       e_name,
       salary,
       d_no,
       (select round(avg(salary), 2)
        from employee
        where d_no = e.d_no) as avg_d_salary
from employee e;