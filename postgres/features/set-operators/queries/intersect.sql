select first_name from employee
intersect
select first_name from customer
order by first_name;