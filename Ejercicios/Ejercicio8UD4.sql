--1--
select id_vuelo, a_desde.ciudad, a_hasta.ciudad, salida, llegada, 
	round(extract(epoch from (llegada-salida))/60,2) as duracion
from vuelo v
	join aeropuerto a_desde on(v.desde=a_desde.id_aeropuerto)
	join aeropuerto a_hasta on(v.hasta=a_hasta.id_aeropuerto)
	join avion a on(a.id_avion=v.id_avion)
where to_char(salida, 'MM') in('12', '11', '10')
  and to_char(salida, 'YYYY')='2023'
  and extract(epoch from (llegada-salida))/60 >120
  and a.max_pasajeros>=300
order by duracion desc;

--2--
select id_reserva,
	c.apellido1 || ' ' || c.apellido2 || ', ' || c.nombre as nombre_completo,
	v.id_vuelo, v.salida, r.fecha_reserva, 
	(v.salida - r.fecha_reserva) as antelacion
from reserva r
	join cliente c using(id_cliente)
	join vuelo v using(id_vuelo)
where (v.salida - r.fecha_reserva) >=interval '10 days'
  and c.apellido1 ilike 'm%'
order by antelacion desc;

--3--
select id_reserva, v.id_vuelo, v.precio,
	coalesce(v.descuento, 0)
from reserva
	join vuelo v using(id_vuelo)
	



select *
from vuelo

select *
from aeropuerto

select *
from avion

select *
from reserva

select *
from cliente