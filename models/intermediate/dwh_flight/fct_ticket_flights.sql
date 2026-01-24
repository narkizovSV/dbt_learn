{{
    config(
        materialized = 'table'
    )
}}
SELECT
    tf.ticket_no as ticket_no,
    tf.flight_id as flight_id,
    tf.fare_conditions as fare_conditions,
    tf.amount as amount,
    (
        select case
            when bp.boarding_no is null 
            then 'no' 
            else 'yes' 
        end
    ) as boarding_pass_exists,
    bp.boarding_no as boarding_no,
    bp.seat_no as seat_no,
    current_date as load_date
FROM {{ ref('stg_booking__ticket_flights') }} AS tf
    LEFT JOIN {{ ref('stg_booking__boarding_passes') }} AS bp ON tf.ticket_no=bp.ticket_no AND tf.flight_id=bp.flight_id