SELECT
    aircraft_code,
    count(*) as seats_cnt
FROM
    {{ ref('stg_booking_seats') }}
GROUP BY
    aircraft_code