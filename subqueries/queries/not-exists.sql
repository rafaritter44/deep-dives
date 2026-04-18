select *
from employee e
where not exists (
    select 1
    from employee
    where manager_no = e.e_no
);