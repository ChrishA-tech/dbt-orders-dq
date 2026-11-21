select o.order_id, o.customer_id, o.order_date, c.channel_key, k.country_key, o.product, o.amount, o.is_missing_amount
from {{ ref('stg_orders') }} o
join {{ ref('dim_channel') }} c using (channel)
join {{ ref('dim_country') }} k using (country)
where o.is_duplicate = 0
