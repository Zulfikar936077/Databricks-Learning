CREATE OR REPLACE VIEW workspace.default.vw_rt_taxi_kpis AS
SELECT
  pickup_hour,
  COUNT(*) AS trips,
  ROUND(AVG(fare_amount), 2) AS avg_fare,
  ROUND(SUM(fare_amount), 2) AS total_fare,
  ROUND(AVG(trip_distance), 2) AS avg_distance
FROM workspace.default.rt_taxi_trip_events
GROUP BY pickup_hour;
