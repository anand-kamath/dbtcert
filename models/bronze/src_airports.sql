
with src_airports as (
    select 
      ident as aiport_ident,
      type as airport_type,
      name as airport_name,
      latitude_deg as airport_lat,
      longitude_deg as airport_long,
      continent,
      iso_country,
      iso_region
    from {{ source('raw', 'airports') }}
)

select * from src_airports


