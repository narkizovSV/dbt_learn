{% set current_date = run_started_at | string | truncate(10, True, '') %}
{% set current_year = run_started_at | string | truncate(4, True, '') | int %}
{% set prev_year = current_year | int - 10 %}
{% set prev_date = prev_year ~ current_date[4:] %}


SELECT 
    count(*)
FROM {{ ref('fct_flights') }}
WHERE scheduled_departure BETWEEN '{{ prev_date }}' and '{{ current_date }}'