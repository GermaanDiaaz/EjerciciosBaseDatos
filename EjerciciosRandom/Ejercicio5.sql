
select round(avg(precipitacion_total),2)
from climatologia
where provincia = 'Sevilla'
  and fecha::text like '2019-04%';


  select *
  from climatologia
  where estacion ilike '%e%'
    and (fecha::text ilike '2019-02-28'
	or fecha::text ilike '2019-03-31'
	or fecha::text ilike '2019-04-30')

	and fecha::text like'2019&'
	and substr(fecha::text, 6, 2)
		in('02', '03', '04')
	/*and substr(fecha::text )*/
order by provincia asc, estacion asc, fecha desc;

select *
from climatologia
where fecha::text like '2019-09%';

select *
from climatologia
where provincia in('Cuenca', 'Albacete', 'Guadalajara', 'Toledo', 'Ciudad Real')
  and (fecha::text like '2019-04%'
  or fecha::text like '2019-05%')
  or (fecha::text like '2019-03%' and right (fecha::text, 2)::int >=21)
  or (fecha::text like '2019-06%' and right (fecha::text, 2)::int <=20)
order by fecha desc;

--Tipico de examen buscar un porcentaje entre tanto y tanto %
