-- Explain plan for a query that is parallelized across shards, which shows the plan for
-- a query on one of the shards and how the aggregation across shards is done.
explain (verbose on) select count(*) from events;