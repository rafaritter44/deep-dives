insert into api.todo (task)
values ('finish tutorial 0'),
       ('pat self on back');

insert into api.file (name, blob)
values ('postgres.png',  pg_read_binary_file('/images/postgres.png')),
       ('ted-codd.webp', pg_read_binary_file('/images/ted-codd.webp'));