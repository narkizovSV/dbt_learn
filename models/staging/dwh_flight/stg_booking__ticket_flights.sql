{{
  config(
    materialized = 'table'
  )
}}
SELECT 
  ticket_no, 
  flight_id, 
  fare_conditions, 
  amount
FROM
  {{ source('demo_src_practics', 'ticket_flights') }}
    