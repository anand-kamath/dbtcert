with source as (
    select * from {{ ref('stg_transactions') }}
),
     agg_token_transfer as (
    select 
        transaction_hash,
        count(*) as token_transfer_count
    from {{ ref('stg_token_transfers') }}
    group by transaction_hash
)
select 
  s.transaction_hash,
  s.block_number,
  s.from_address,
  s.to_address,
  s.date,
  s.value,
  s.receipt_contract_address,
  s.input,
  t.token_transfer_count,
  case when s.receipt_contract_address != '' then 'contract creation'
       when t.transaction_hash is not null then 'token transfer'
       when s.input = '0x' and s.value > 0 then 'plain_eth_transaction' 
       else 'other'
       end as transaction_category
from source s
left join agg_token_transfer t on s.transaction_hash = t.transaction_hash
