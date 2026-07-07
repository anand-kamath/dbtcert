with runways as (
    select * from {{ ref('int_runways') }}
),
airports as (
    select * from {{ ref('int_airports') }}
)
select 
  a.airport_type,
  count(distinct r.runway_id) as runway_count
from runways r 
left join airports a on r.airport_ident = a.aiport_ident
group by 1


