-- Singular test: the injected root cause (store) must show the highest lift.
select 1 where (select channel from {{ ref('dq_by_channel') }} order by lift desc limit 1) <> 'store'
