{% macro convert_from_eth(value, rate) %}
    sum({{value}}/(power(10, {{rate}})))
{% endmacro %}