with source as (
    select * from {{ source('ethereum', 'transactions') }}
)
select
  s.hash as transaction_hash,
  s.block_number,
  s.from_address,
  s.to_address,
  s.date,
  s.value,
  s.receipt_contract_address,
  s.input
from source s