-- �������� ������ ������� products � �������� catalogs, ������� ������������� ������.
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