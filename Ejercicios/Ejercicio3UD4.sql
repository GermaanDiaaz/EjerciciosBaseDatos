select *, to_char(fecha_operacion, 'ID-MM')
from inmueble join operacion using(id_inmueble)
	join vendedor using(id_vendedor)
where to_char(fecha_operacion, 'ID-MM') in('1-02', '5-03')
  and superficie > 200
  and nombre ilike '%A%';

select round(avg(precio_final/superficie),2) as precio_Medio_M2
from inmueble join operacion using(id_inmueble)
where tipo_operacion = 'Alquiler'
  and to_char(fecha_operacion, 'MM') in('03', '04')
  and provincia in('Granada', 'Almería', 'Málaga', 'Cádiz', 'Huelva');

--Apartado 3

select round(avg(((i.precio - o.precio_final) / i.precio) * 100),2) as porcentaje_diferencia_medio
from inmueble i
	join operacion o on i.id_inmueble = o.id_inmueble
	join tipo t on i.tipo_inmueble = t.id_tipo
where i.tipo_operacion = 'Alquiler'
  and extract(month from o.fecha_operacion) = 1
  and t.nombre in ('Oficina', 'Local', 'Suelo');


--Apartado 4
select distinct c.nombre
from comprador c
	join operacion o on c.id_cliente = o.id_cliente
	join inmueble i on o.id_inmueble = i.id_inmueble
	join tipo t on i.tipo_inmueble = t.id_tipo
where t.nombre in ('Casa', 'Piso')
  and i.provincia in ('Jaén', 'Córdoba')
  and o.precio_final between 150000 and 200000
  and o.fecha_operacion - i.fecha_alta between 90 and 120;

-- Apartado 5
select
    avg(i.precio) as media_inicial,
    avg(o.precio_final) as media_final,
    avg(((i.precio - o.precio_final) / i.precio) * 100) as media_diferencia_porcentaje
from inmueble i
	join operacion o on i.id_inmueble = o.id_inmueble
	join tipo t on i.tipo_inmueble = t.id_tipo
where t.nombre in ('Casa', 'Piso')
  and i.tipo_operacion = 'Alquiler'
  and i.superficie < 100
  and o.fecha_operacion - i.fecha_alta >= 365;

-- Apartado 6

select o.*, i.provincia, t.nombre
from operacion o
	join inmueble i on o.id_inmueble = i.id_inmueble
	join tipo t on i.tipo_inmueble = t.id_tipo
where t.nombre in ('Casa', 'Piso')
  and i.tipo_operacion = 'Alquiler'
  and i.provincia = 'Huelva'
  and extract(month from o.fecha_operacion) in (7, 8)
order by o.precio_final desc
limit 1;



select *
from inmueble


select *
from operacion