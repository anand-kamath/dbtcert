with source as (
    select * from {{ source('ethereum', 'token_transfers') }}
)

select 
  transaction_hash,
  token_address,
  from_address,
  to_address,
  value,
  date
from source