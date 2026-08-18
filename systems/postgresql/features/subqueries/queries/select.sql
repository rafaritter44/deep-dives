select e_no,
       e_name,
       d_no,
       manager_no,
       salary,
       (select round(avg(salary), 2) from employee) as avg_salary
from employee;