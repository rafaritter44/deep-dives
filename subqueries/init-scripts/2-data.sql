insert into department (d_no, d_name)
values (1, 'Executive Office'),
       (2, 'Engineering'),
       (3, 'Marketing'),
       (4, 'HR');

insert into employee (e_no, e_name, salary, d_no, manager_no)
values (1, 'Alice',   8000, 1, 1),
       (2, 'Bob',     7000, 2, 1),
       (3, 'Charlie', 6000, 2, 2),
       (4, 'David',   5000, 2, 2),
       (5, 'Eve',     4000, 3, 1),
       (6, 'Frank',   3000, 3, 5),
       (7, 'Grace',   2000, 4, 1),
       (8, 'Heidi',   1000, 4, 7);