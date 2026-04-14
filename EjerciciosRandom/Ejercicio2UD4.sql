select first_name, last_name
from employees join departments using(department_id)
where department_name in('IT', 'Finance')
  and to_char(hire_date, 'MM')='04';


select first_name, last_name
from employees join departments using (department_id)
where department_name='Administration';

select country_name
from countries 
	join locations using(country_id)
	join departments using(location_id)
where department_name='Public Relations';


select *
from employees 
	join departments using(department_id)
	join locations using(location_id)
	join countries using(country_id)
where country_name='United States of America';


select d.first_name nombre_hijo, d.last_name apellido_hijo,
	   e.first_name nombre_padre, e.last_name apellido_padre
from dependents d, employees e
	join departments using(department_id)
	join locations using(location_id)
	join countries using(country_id)
where country_name='United States of America';


select first_name, last_name, salary, country_name
from employees e
	join departments d on e.department_id = d.department_id
	join locations using(location_id)
	join countries using(country_id)
	join regions using(region_id)
where region_name='Europe' 
  and salary>8000
order by salary desc;



select *
from employees
where country_name like 'A%'


