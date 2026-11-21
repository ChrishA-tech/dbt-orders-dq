-- Staging: type, flag and deduplicate raw orders. Duplicates are kept out of marts but counted in quality models.
with src as (select * from {{ ref('raw_orders') }}),
ranked as (
  select *, row_number() over (partition by order_id order by order_date) as rn from src
)
select
  order_id,
  customer_id,
  product,
  coalesce(country, 'UNKNOWN') as country,
  channel,
  amount,
  cast(order_date as date) as order_date,
  (amount is null)::int as is_missing_amount,
  (rn > 1)::int as is_duplicate
from ranked
