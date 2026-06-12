select
  date,
  transaction_category,
  count(*) as tx_count,
  {{convert_from_eth('value', '18')}} as sum_eth_value

from {{ ref('transactions_enriched') }}
group by 
date,
transaction_category 