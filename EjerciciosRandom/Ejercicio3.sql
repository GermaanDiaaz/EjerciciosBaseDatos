select *
from employees
where department_id > 8 and department_id <12;

select *
from countries
where country_name like '_a%';


 select first_name, last_name, salary as "Salario_anual"
 from employees
 where salary*12 >=100000 and job_id !=6;


 select *
 from departments
 where department_name ilike'%t%t%' ;


  select *
  from locations
  where city in ('Toronto', 'Oxford')
     or state_province = 'California';


select max(salary), min(salary)
from employees;
  