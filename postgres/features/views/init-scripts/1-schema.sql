create table person (
    person_id bigserial primary key,
    person_name text not null
);

create view person_name as
    select distinct person_name
    from person;