select e_no, e_name, salary, d_no, manager_no, avg_d_salary
from (select d_no, round(avg(salary), 2) as avg_d_salary
      from employee
      group by d_no)
natural join employee
where salary > avg_d_salary;