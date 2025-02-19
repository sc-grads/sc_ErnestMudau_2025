select category_id, avg(list_price)
from [bikestores].[production].[products]
group by category_id
having avg(list_price) > 800