create table department (
    d_no integer primary key,
    d_name text
);

create table employee (
    e_no integer primary key,
    e_name text,
    salary numeric(10, 2),
    d_no integer references department,
    manager_no integer references employee
);