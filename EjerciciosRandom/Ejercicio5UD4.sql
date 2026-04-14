select *
from products;

select *
from orders;

select *
from categories;

select *
from customers;

select product_name
from products
	join order_details using(product_id)
	join orders using(order_id)
	join shippers on(ship_via=shipper_id)
where company_name like 'United Package';


select product_name, c.category_name
from products
	join categories c using(category_id)
	join order_details using(product_id)
	join orders o using(order_id)
where to_char(o.order_date, 'MM')='08';

	
select company_name
from customers;


select first_name
from employees
	join orders using(employee_id)
	join customers c using(customer_id)
where c.country like'Brazil';


select category_name, p.product_name
from categories
	join products p using(category_id)
	join order_details using(product_id)
	join orders using(order_id)
	join employees e using(employee_id)
where e.first_name like'Janet'
  and e.last_name like 'Leverling';
