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
    ein        text not null,
    e_no       int  not null,
    e_name     text not null,
    manager_no int  not null,
    primary key (ein, e_no),
    foreign key (ein)        references company,
    foreign key (manager_no) references employee
);

create table employee_department (
    ein  text not null,
    e_no int  not null,
    d_no int  not null,
    primary key (ein, e_no),
    foreign key (ein, e_no) references employee,
    foreign key (ein, d_no) references department
);