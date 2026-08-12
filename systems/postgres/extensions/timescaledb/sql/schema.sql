-- Create a hypertable with automatic columnstore.
CREATE TABLE sensor_data (
    time TIMESTAMPTZ NOT NULL,
    sensor_id TEXT NOT NULL,
    temperature DOUBLE PRECISION,
    humidity DOUBLE PRECISION,
    pressure DOUBLE PRECISION
) WITH (
    tsdb.hypertable
);
CREATE INDEX idx_sensor_id_time ON sensor_data(sensor_id, time DESC);