# Data Types

## Date/Time Types (WIP)

For `timestamp with time zone` values, an input string that includes an explicit time zone will be converted to UTC using the appropriate offset for that time zone. If no time zone is stated in the input string, then it is assumed to be in the time zone indicated by the system's TimeZone parameter, and is converted to UTC using the offset for the `timezone zone`. In either case, the value is stored internally as UTC, and the originally stated or assumed time zone is not retained.

When a `timestamp with time zone` value is output, it is always converted from UTC to the current `timezone` zone, and displayed as local time in that zone. To see the time in another time zone, either change `timezone` or use the `AT TIME ZONE` construct.

sum(interval)

### References

https://www.postgresql.org/docs/current/datatype-datetime.html
https://www.postgresql.org/docs/current/functions-datetime.html

## Range Types (WIP)

range_agg
range_intersect_agg

### References

https://www.postgresql.org/docs/current/rangetypes.html
https://www.postgresql.org/docs/current/functions-range.html