create schema api;

create table api.todo (
    id   bigserial primary key,
    done boolean   not null default false,
    task text      not null,
    due  timestamptz
);

create role web_anon nologin;
grant usage on schema api to web_anon;
grant select on api.todo to web_anon;

create role authenticator noinherit login password 'mysecretpassword';
grant web_anon to authenticator;