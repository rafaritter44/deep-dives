\set ein '12-3456789'

insert into company (ein, c_name)
values (:'ein', 'Company A');

insert into department (ein, d_no, d_name)
values (:'ein', 1, 'Executive Office'),
       (:'ein', 2, 'Engineering'),
       (:'ein', 3, 'HR'),
       (:'ein', 4, 'Marketing');

insert into employee (ein, e_no, e_name, manager_no)
values (:'ein', 1, 'Alice',   1),
       (:'ein', 2, 'Bob',     1),
       (:'ein', 3, 'Charlie', 2),
       (:'ein', 4, 'David',   2),
       (:'ein', 5, 'Eve',     1),
       (:'ein', 6, 'Frank',   5),
       (:'ein', 7, 'Grace',   1),
       (:'ein', 8, 'Heidi',   7);

insert into employee_department (ein, e_no, d_no)
values (:'ein', 1, 1),
       (:'ein', 2, 2),
       (:'ein', 3, 2),
       (:'ein', 4, 2),
       (:'ein', 5, 3),
       (:'ein', 6, 3);