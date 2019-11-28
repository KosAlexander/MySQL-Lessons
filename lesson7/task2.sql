-- Выведите список товаров products и разделов catalogs, который соответствует товару.
use shop;

select
	p.name,
	c.name
from 
	catalogs as c
join
	products as p	
on 
	p.catalog_id = c.id