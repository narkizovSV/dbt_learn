{%- set status_query %}
SELECT distinct
    status
FROM {{ ref('stg_booking__flights') }}
{% endset %} 

{%- set status_query_result = run_query(status_query) %}

{%- if execute %}
    {% set statutes = status_query_result.columns[0].values() %}
{% else %}
    {% set statutes = [] %}
{% endif %}

SELECT
    {% for status_name in statutes %}
    SUM(CASE WHEN status = '{{ status_name }}' THEN 1 ELSE 0 END) as status_{{status_name.replace(" ","_")}}
        {%- if not loop.last %},{% endif %}
    {%- endfor %}
FROM
    {{ ref('stg_booking__flights') }}