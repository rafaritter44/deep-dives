-- Insert some events.
insert into events (device_id, data)
select s % 100, ('{"measurement":'||random()||'}')::jsonb from generate_series(1,1000000) s;