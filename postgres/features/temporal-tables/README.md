# Temporal Tables (WIP)

## References

Temporal tables:
https://www.postgresql.org/docs/19/ddl-temporal-tables.html

### Temporal Constraints

PK/UNIQUE - WITHOUT OVERLAPS:
https://www.postgresql.org/docs/current/sql-createtable.html#SQL-CREATETABLE-PARMS-UNIQUE

Temporal primary keys and unique constraints are backed by GiST indexes rather than B-Tree indexes. In practice, creating a temporal primary key or constraint requires installing the btree_gist extension, so that the database has GiST operator classes for the non-temporal parts of the key.

Temporal primary keys and unique constraints have the same behavior as exclusion constraints, where each regular key part is compared with equality, and the application time is compared with overlaps, for example `EXCLUDE USING gist (id WITH =, valid_at WITH &&)`. The only difference is that they also forbid an empty application time.

FK - PERIOD:
https://www.postgresql.org/docs/current/sql-createtable.html#SQL-CREATETABLE-PARMS-REFERENCES

PostgreSQL supports temporal foreign keys with action `NO ACTION`, but not `RESTRICT`, `CASCADE`, `SET NULL`, or `SET DEFAULT`.

### Temporal DML

UPDATE/DELETE - FOR PORTION OF:
https://www.postgresql.org/docs/19/dml-application-time-update-delete.html