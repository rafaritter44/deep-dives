select brand, size, sum(sales)
from items_sold
group by cube (brand, size);