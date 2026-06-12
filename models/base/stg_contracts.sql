{{
  config(
    materialized = 'view',
    )
}}
with source as (
    select * from {{ source('ethereum', 'contracts') }}
)
select
  address as contract_address,
  bytecode,
  date,
  last_modified
from source