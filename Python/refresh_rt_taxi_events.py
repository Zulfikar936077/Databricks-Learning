from pyspark.sql import functions as F


SOURCE_TABLE = "samples.nyctaxi.trips"
TARGET_TABLE = "workspace.default.rt_taxi_trip_events"


def main() -> None:
    df = (
        spark.table(SOURCE_TABLE)
        .select(
            "tpep_pickup_datetime",
            "tpep_dropoff_datetime",
            "trip_distance",
            "fare_amount",
            "pickup_zip",
            "dropoff_zip",
        )
        .withColumn("ingested_at", F.current_timestamp())
        .withColumn("pickup_hour", F.date_trunc("hour", F.col("tpep_pickup_datetime")))
    )

    df.write.mode("overwrite").saveAsTable(TARGET_TABLE)
    print(f"Refreshed {TARGET_TABLE} from {SOURCE_TABLE}")


if __name__ == "__main__":
    main()
