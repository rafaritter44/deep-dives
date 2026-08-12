select *
from employee e
natural join lateral (
    select round(avg(salary), 2) as avg_d_salary
    from employee
    where d_no = e.d_no
)
where salary > avg_d_salary;