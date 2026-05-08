-- Latest hourly KPI trend
SELECT
  pickup_hour,
  trips,
  avg_fare,
  total_fare,
  avg_distance
FROM workspace.default.vw_rt_taxi_kpis
ORDER BY pickup_hour DESC
LIMIT 24;

-- Top pickup zip codes by trip count
SELECT
  pickup_zip,
  COUNT(*) AS trips,
  ROUND(AVG(fare_amount), 2) AS avg_fare
FROM workspace.default.rt_taxi_trip_events
GROUP BY pickup_zip
ORDER BY trips DESC
LIMIT 10;

-- Revenue by pickup hour
SELECT
  pickup_hour,
  ROUND(SUM(fare_amount), 2) AS hourly_revenue
FROM workspace.default.rt_taxi_trip_events
GROUP BY pickup_hour
ORDER BY pickup_hour DESC
LIMIT 24;
