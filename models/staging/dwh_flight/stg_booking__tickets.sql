{{
  config(
    materialized = 'table'
  )
}}
SELECT 
  ticket_no, 
  book_ref, 
  passenger_id, 
  passenger_name, 
  contact_data
FROM {{ source('demo_src_practics', 'tickets') }}

{%- if target.name == 'dev' %}
LIMIT 10000
{% endif %}