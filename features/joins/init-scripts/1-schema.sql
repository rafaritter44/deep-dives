create table company (
    ein    text not null,
    c_name text not null,
    primary key (ein)
);

create table department (
    ein    text not null,
    d_no   int  not null,
    d_name text not null,
    primary key (ein, d_no),
    foreign key (ein) references company
);

create table employee (
    e_no       int  not null,
    e_name     text not null,
    manager_no int  not null,
    primary key (e_no),
    foreign key (manager_no) references employee
);

create table employee_department (
    e_no int  not null,
    ein  text not null,
    d_no int  not null,
    primary key (e_no),
    foreign key (e_no)      references employee,
    foreign key (ein, d_no) references department
);