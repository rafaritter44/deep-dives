select brand, size, sum(sales)
from items_sold
group by grouping sets ((brand), (size), ());