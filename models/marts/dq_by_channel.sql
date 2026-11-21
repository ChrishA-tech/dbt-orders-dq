-- Root-cause view: share of missing amounts by channel vs share of all orders (lift > 1 = concentrated).
select channel,
       count(*) as orders,
       sum(is_missing_amount) as missing_amount,
       round(sum(is_missing_amount) * 1.0 / nullif(sum(sum(is_missing_amount)) over (), 0)
             / (count(*) * 1.0 / sum(count(*)) over ()), 2) as lift
from {{ ref('stg_orders') }}
where is_duplicate = 0
group by channel
