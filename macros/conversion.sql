{% macro convert_from_eth(value, rate) %}
    sum({{value}}/(1e{{rate}}))
{% endmacro %}