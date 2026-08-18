-- Get the last 3 events for device 1, routed to a single node.
select * from events where device_id = 1 order by event_time desc, event_id desc limit 3;