insert into api.todo (task)
values ('finish tutorial 0'),
       ('pat self on back');

insert into api.file (blob)
values (pg_read_binary_file('/images/postgres.webp')),
       (pg_read_binary_file('/images/ted-codd.webp'));