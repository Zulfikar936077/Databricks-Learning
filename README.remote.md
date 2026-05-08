# Databricks Learning - Mini Real-Time Taxi Monitor

This mini project shows a simple end-to-end Databricks flow:

1. Ingest sample trip data into a working table (`workspace.default.rt_taxi_trip_events`)
2. Build KPI analytics view (`workspace.default.vw_rt_taxi_kpis`)
3. Query BI-ready metrics from SQL or notebooks

## Project Structure

- `sql/01_create_rt_table.sql`: creates the working events table from `samples.nyctaxi.trips`
- `sql/02_kpi_view.sql`: creates a KPI view aggregated by pickup hour
- `sql/03_bi_queries.sql`: BI queries for quick analytics
- `python/refresh_rt_taxi_events.py`: PySpark refresh script (batch refresh pattern)

## How To Run

### SQL path

Run in order:

1. `sql/01_create_rt_table.sql`
2. `sql/02_kpi_view.sql`
3. `sql/03_bi_queries.sql`

### Python/PySpark path

Run `python/refresh_rt_taxi_events.py` from a Databricks notebook or job task, then run KPI queries.

## Notes

- Uses Databricks sample dataset: `samples.nyctaxi.trips`
- Targets workspace catalog objects for easy experimentation
- Good starter pattern for near real-time analytics demos
# Databricks-Learning
This repo will contains the tools and relevant concepts connected to Analytical Engineering
