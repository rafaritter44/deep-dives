create table events (
  device_id bigint,
  event_id bigserial,
  event_time timestamptz default now(),
  data jsonb not null,
  primary key (device_id, event_id)
);

-- Distribute the events table across shards placed locally or on the worker nodes.
select create_distributed_table('events', 'device_id');