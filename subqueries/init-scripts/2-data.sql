insert into department (d_no, d_name)
values (1, 'Engineering'),
       (2, 'Marketing'),
       (3, 'HR');

insert into employee (e_no, e_name, salary, d_no)
values (1, 'Alice',   7000, 1),
       (2, 'Bob',     6000, 1),
       (3, 'Charlie', 5000, 1),
       (4, 'David',   4000, 2),
       (5, 'Eve',     3000, 2),
       (6, 'Frank',   2000, 3),
       (7, 'Grace',   1000, 3);