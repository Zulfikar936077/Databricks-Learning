CREATE OR REPLACE TABLE workspace.default.rt_taxi_trip_events AS
SELECT
  tpep_pickup_datetime,
  tpep_dropoff_datetime,
  trip_distance,
  fare_amount,
  pickup_zip,
  dropoff_zip,
  current_timestamp() AS ingested_at,
  date_trunc('hour', tpep_pickup_datetime) AS pickup_hour
FROM samples.nyctaxi.trips;
