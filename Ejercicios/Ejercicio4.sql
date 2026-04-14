Select hombres
from demografia_basica
where (anio between 2002 and 2003)
and provincia ILIKE 'Extremadura';


Select * 
from demografia_basica
where hombres >=600000 or mujeres >= 600000
ORDER BY provincia desc, anio desc;


Select * 
from demografia_basica
where (hombres >=600000 or mujeres >= 600000)
and anio >=2025-5
ORDER BY (hombres + mujeres) desc;


Select provincia, rango_edad, numero_habitantes
from demografia_avanzada
where sexo ='M'
and (edad_menor >= 20 and edad_mayor<= 29)
and anio = 2018
and provincia in('Jaén', 'Córdoba', 'Sevilla', 'Huelva', 'Granada', 'Málaga', 'Alm')
order by numero_habitantes asc;


select *
from demografia_avanzada
where provincia='Madrid'
and sexo='H'
and (anio BETWEEN 2010 and 2015)
and (edad_menor<20 or edad_mayor>65)
order by anio asc, numero_habitantes desc, edad_menor asc, edad_mayor asc;
