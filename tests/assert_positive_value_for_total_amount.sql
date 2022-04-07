-- refunds have a negative amount, so the total amount should always be >= 0.
-- therefore, return records where this is not true to make the test fail.
select  order_id,
        sum(amount) as total_amount
from    {{ ref('stg_payments') }}
group by 1
having not(total_amount >= 0)