select *
from inmueble
	join operacion using(id_inmueble)
where provincia like'Sevilla'
  and to_char(fecha_alta, 'YYYY')= '2023'
order by precio desc
limit 3;


select round(avg(precio),2)
from inmueble 
where provincia= 'Málaga'
  and to_char(fecha_alta, 'MM')= '07'
   or to_char(fecha_alta, 'MM')= '08';


select *
from inmueble
	join operacion using(id_inmueble)
	join tipo on(tipo_inmueble=id_tipo)
where tipo_operacion= 'Venta'
  and provincia in('Córdoba', 'Jaén')
  --and to_char (fecha_operacion, 'Q') = '4'
  and extract(year from fecha_operacion) in(2022, 2023)
  and extract(month from fecha_operacion) in(12, 11, 10);



select round(avg(precio), 2)
from inmueble 
	join operacion using(id_inmueble)
	join tipo t on(tipo_inmueble=id_tipo)
where t.nombre = 'Parking'
  and tipo_operacion = 'Venta'
  and provincia = 'Huelva'
--and extract(isodow from fecha_operacion) between 1 and 5;
  and to_char(fecha_operacion, 'D') between '2' and '6';



select *
from inmueble 
	join operacion using(id_inmueble)
	join tipo t on(tipo_inmueble=id_tipo)
where provincia = 'Granada'
  and tipo_operacion = 'Venta'
  and t.nombre = 'Piso'
  and fecha_operacion - fecha_alta between 90 and 180;
--and age(fecha_operacion, fecha_alta) between interval '3 months' and interval '6 months';



























