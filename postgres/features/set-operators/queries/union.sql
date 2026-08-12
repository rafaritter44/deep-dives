select first_name from employee
union
select first_name from customer
order by first_name;