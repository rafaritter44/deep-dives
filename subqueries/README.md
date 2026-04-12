# Subqueries

all:
SELECT department_id, AVG(SALARY)
FROM employees GROUP BY department_id
HAVING AVG(SALARY)>=ALL
(SELECT AVG(SALARY) FROM employees
GROUP BY department_id);

SOME is a synonym for ANY. IN is equivalent to = ANY.
NOT IN is equivalent to <> ALL.

any:
SELECT first_name, last_name,department_id
FROM employees
WHERE department_id= ANY
(SELECT DEPARTMENT_ID
FROM departments WHERE location_id=1700);

in:
SELECT first_name, last_name,department_id
FROM employees
WHERE department_id IN
(SELECT DEPARTMENT_ID FROM departments
WHERE location_id=1800);

not in:
SELECT first_name, last_name,department_id
FROM employees
WHERE department_id NOT IN
(SELECT DEPARTMENT_ID FROM departments
WHERE manager_id
BETWEEN 100 AND 200);

exists:
SELECT employee_id, first_name, last_name, job_id, department_id
FROM employees E
WHERE EXISTS
(SELECT * FROM employees
WHERE manager_id = E.employee_id);

row subquery:
SELECT first_name
FROM employees
WHERE ROW(department_id, manager_id) =
(SELECT department_id, manager_id
FROM departments
WHERE location_id = 1800);

## In the WHERE clause

```
psql "postgres://postgres:example@localhost/postgres" -f queries/where.sql
```

## In the SELECT clause

```
psql "postgres://postgres:example@localhost/postgres" -f queries/select.sql
```

## In the FROM clause

```
psql "postgres://postgres:example@localhost/postgres" -f queries/from.sql
```

## EXISTS

```
psql "postgres://postgres:example@localhost/postgres" -f queries/exists.sql
```

## IN

```
psql "postgres://postgres:example@localhost/postgres" -f queries/in.sql
```

## NOT IN

```
psql "postgres://postgres:example@localhost/postgres" -f queries/not-in.sql
```

## ANY/SOME

```
psql "postgres://postgres:example@localhost/postgres" -f queries/any.sql
```

```
psql "postgres://postgres:example@localhost/postgres" -f queries/some.sql
```

## ALL

```
psql "postgres://postgres:example@localhost/postgres" -f queries/all.sql
```

## Single-Row Comparison

```
psql "postgres://postgres:example@localhost/postgres" -f queries/row.sql
```

## Correlated subqueries

### In the WHERE clause

```
psql "postgres://postgres:example@localhost/postgres" -f queries/correlated-where.sql
```

### In the SELECT clause

```
psql "postgres://postgres:example@localhost/postgres" -f queries/correlated-select.sql
```

### In the FROM clause (LATERAL)

```
psql "postgres://postgres:example@localhost/postgres" -f queries/correlated-from.sql
```