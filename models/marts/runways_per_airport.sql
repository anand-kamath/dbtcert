with runways as (
    select * from {{ ref('int_runways') }}
),
airports as (
    select * from {{ ref('int_airports') }}
)
select
    r.runway_id,
    r.airport_ident,
    r.runway_length_ft,
    r.runway_width_ft,
    r.runway_surface,
    r.runway_lighted,
    r.runway_closed,
    a.airport_name,
    a.airport_type,
from runways r
left join airports a on r.airport_ident = a.aiport_ident
