# Temporal Tables

## Temporal Constraints

### PK/UNIQUE - WITHOUT OVERLAPS

Temporal primary keys and unique constraints are backed by GiST indexes rather than B-Tree indexes. In practice, creating a temporal primary key or constraint requires installing the btree_gist extension, so that the database has GiST operator classes for the non-temporal parts of the key.

Temporal primary keys and unique constraints have the same behavior as exclusion constraints, where each regular key part is compared with equality, and the application time is compared with overlaps, for example `EXCLUDE USING gist (id WITH =, valid_at WITH &&)`. The only difference is that they also forbid an empty application time.

### FK - PERIOD

The constraint is considered satisfied if the referenced table has matching records (based on the non-`PERIOD` parts of the key) whose combined `PERIOD` values completely cover the referencing record's. In other words, the reference must have a referent for its entire duration.

PostgreSQL supports temporal foreign keys with action `NO ACTION`, but not `RESTRICT`, `CASCADE`, `SET NULL`, or `SET DEFAULT`.

## Temporal DML

### UPDATE/DELETE - FOR PORTION OF

Instead of using the `FROM ... TO ...` syntax, temporal update/delete commands can also give the targeted range/multirange directly, inside parentheses. For example: `DELETE FROM products FOR PORTION OF valid_at ('[2028-01-01,)') ...`. This syntax is required when application time is stored in a multirange column.

The bounds given to `FOR PORTION OF` must be constant. Functions like `now()` are allowed, but column references are not.

When temporal leftovers are inserted, all `INSERT` triggers are fired, but permission checks for inserting rows are skipped.

In `READ COMMITTED` mode, temporal updates and deletes can yield unexpected results when they concurrently touch the same row. It is possible to lose all or part of the second update or delete. To solve these problems, precede every temporal update/delete with a `SELECT FOR UPDATE` matching the same criteria (including the targeted portion of application time). That way the actual update/delete doesn't begin until the lock is held, and all concurrent leftovers will be visible. In higher transaction isolation levels, this lock is not required.
