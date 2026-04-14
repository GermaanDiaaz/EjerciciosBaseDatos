---------Ejercicio 1------------
select sum(precio_final)
from operacion 
	join inmueble i using(id_inmueble)
where i.provincia in('Córdoba', 'Sevilla')
  and i.tipo_operacion = 'Alquiler'
  and age(fecha_operacion, i.fecha_alta) between '3' and '4';
  
---------Ejercicio 2------------
select round(avg(precio_final), 2)
from operacion
	join inmueble i using(id_inmueble)
where i.tipo_operacion = 'Venta'
  and extract(Month from fecha_operacion) between '06' and '09'
  and (extract(Month from fecha_operacion) = 06
  		and extract(D from fecha_operacion) >= 21)
  or (extract(Month from fecha_operacion) = 09
  		and extract(D from fecha_operacion) <= 20);

---------Ejercicio 3------------
select distinct v.nombre
from vendedor v
	join operacion o using(id_vendedor)
	join inmueble i using(id_inmueble)
	join tipo t on(i.tipo_inmueble=t.id_tipo)
where i.tipo_operacion = 'Venta'
  and t.nombre = 'Local'
  and i.provincia in('Sevilla', 'Huelva', 'Cádiz')
  and i.superficie>100
  and (extract(Month from o.fecha_operacion) = 06
  		and extract(d from o.fecha_operacion) = 4)
   or(extract(Month from o.fecha_operacion) = 05
  		and extract(d from o.fecha_operacion) = 5);

---------Ejercicio 4------------
select *
from comprador c
	join operacion o using(id_cliente)
	join inmueble i using(id_inmueble)
	join vendedor v using(id_vendedor)
	join tipo t on(i.tipo_inmueble=t.id_tipo)
where t.nombre not in('Local', 'Oficina')
  and extract(d from i.fecha_alta) %2!=0
  or extract(year from o.fecha_operacion) %2!=1
 and i.tipo_operacion in ('Venta', 'Alquiler')


---------Ejercicio 5------------
select *
from inmueble i
	join operacion o on(o.id_inmueble=i.id_inmueble)
where extract('MM' from age())





select *
from inmueble;

select *
from vendedor;

select *
from operacion;

select *
from tipo;

select *
from comprador;