select brand, size, sum(sales)
from items_sold
group by rollup (brand, size);