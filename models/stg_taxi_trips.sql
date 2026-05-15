with 
source as (
    select * from {{ source('chicago_taxi', 'taxi_trips') }}
),

renamed as (
    select 
        unique_key,
        taxi_id,
        trip_start_timestamp,
        trip_end_timestamp,
        trip_seconds,
        trip_miles,
        fare,
        tips,
        trip_total,
        company
    from source
)

select * from renamed
