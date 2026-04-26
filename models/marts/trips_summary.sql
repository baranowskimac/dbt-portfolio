with trips as (
    SELECT * FROM {{ref('stg_taxi_trips')}}
),

summary as (
    SELECT
        company,
        date_trunc(trip_start_timestamp, month) AS trip_month,
        count(unique_key) AS total_trips,
        round(avg(trip_miles), 2) AS avg_miles,
        round(avg(fare), 2) as avg_fare,
        round(avg(trip_total)) as total_revenue
    from trips
    group by 1, 2
)

select * from summary