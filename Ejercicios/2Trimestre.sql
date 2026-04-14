select*
from employees;

select first_name, last_name, department_name, job_title
from departments d, employees e, jobs j
where d.department_id = e.department_id
  and j.job_id = e.job_id
  and (d.department_name='Administration'
   or d.department_name='IT')
order by first_name, last_name, department_name;


select *
from  employees natural join jobs;


select *
from employees join departments
		using (department_id);

z

select first_name, last_name, department_name, job_title
from employees join departments
	join jobs on (job=job_id)


select first_name, last_name, region_name
from employees join departments using (depart) regions
where region_name in('Europe', 'Americas');

select count (*) 
from employees
	join departments using (department_id);

select department_name
from departments
	left join employees using (department_id)
where employee_id is null;



update employees
set department_id = null
where employee_id = 100;


--------------------------Ejercicio 1---------------------------------------------------------
--------------------------1.2---------------------------------------------------------
select department_name
from departments
	join employees using (department_id)
where hire_date::text like '1993%';


--------------------------1.4---------------------------------------------------------
select employees.first_name
from employees
	join employees on (employees.manager_id=employee_id)
where dependents.last_name in ('D%', 'H%', 'S%');

--------------------------1.5---------------------------------------------------------
select count (*)
from dependents
	join employees using (employee_id)
	join departments using (department_id)
where department_name in('Administration', 'Marketing', 'IT');



select '2026-01-14'::date;


select current_date + interval '1 year 4 months 12 days 3 hours';

select age (current_date,  '2005-05-26');	


select count (*)
from employees
where hire_date between make_date(1996, 1, 1)
  and make_date(2000, 1, 1);



select to_char (current_date+1, 'FMDay, DD-MM-YYYY');
















		
/*
		 _________
		/		  \
	  (|  0  ^  0  |)
	    \   \_/   /
		 |       |
	     |       |



*/