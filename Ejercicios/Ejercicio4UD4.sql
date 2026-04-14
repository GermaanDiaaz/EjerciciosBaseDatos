select *
from products;

select company_name, contact_name
from customers join orders using(customer_id);


select count(*)
from orders join shippers using()
where order_date between make_date (1990,1,1)
  and make_date(1999, 12, 31)
  --and company_name in('Federal Shipping', 'United Package');

select product_name
from products 
	join order_details using(prod)
----ASI SI QUE VA----

select sum(unit_price *quantity *(1-discount))
from orders
	join order_details using(order_id)
where to_char(order_date, 'YY')='96';


select contact_name, last_name, first_name
from orders
	join customers using(customer_id)
	join employees using(employee_id)
where required_date - shipped_date <20;

--Ejercicio5--
select distinct product_name
from products
	join order_details using(product_id)
	join orders using(order_id)
	join shippers on (ship_via = shipper_id)
where company_name = 'United Package';


select distinct product_name, category_name
from orders
	join order_details using(order_id)
	join products using(product_id)
	join categories using(category_id)
where extract(month from order_date)=8


select distinct company_name
from customers;


select distinct first_name, last_name
from employees 
	join orders using(employee_id)
	join 


select category_name
from categories 
	join products using(category_id)
	join orders using(employee_id)
	join employees using(employee_id)
where first_name= 'Janet';












