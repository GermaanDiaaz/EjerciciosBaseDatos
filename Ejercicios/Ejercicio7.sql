select *
from vuelos;


select count (*)
from vuelos
where (desde = 'Berlín' and hasta = 'Londres')
  and (salida::text like '2020-10%'
   or salida::text like '2020-11%'
   or salida::text like '2020-12%');



 select *,
 	Coalesce(round(precio-(precio*descuento/100),2), precio) as PrecioConDescuento
 from vuelos
 where salida::text like '2020-12%'
   and desde in('Sevilla', 'Málaga')
   and hasta in('Madrid', 'Barcelona');

select *
from vuelos
where descuento is null
  and right(left(llegada::text, 7),2) = '10'
  and substr(llegada::text,9,2)::int between 1 and 15
  --and (llegada >= '2020-10-01' and llegada < '2020-10-16')
  and hasta = 'Nueva York';

select *
from vuelos
where salida::text like '2021-01%'
  and desde = 'Ámsterdam'
  and substr(llegada::text, 12,2)::int = 9;

select *,
	Coalesce(round(precio-(precio*descuento/100),2), precio) as Precio_Final,
	case
		when Coalesce(round(precio-(precio*descuento/100),2), precio)
			>=300 then 'MUY CARO'
		when Coalesce(round(precio-(precio*descuento/100),2), precio)
			>=200 then 'CARO'
		when Coalesce(round(precio-(precio*descuento/100),2), precio)
			>=120 then 'NORMAL'
		when Coalesce(round(precio-(precio*descuento/100),2), precio)
			>=60 then 'ECONÓMICO'
		when Coalesce(round(precio-(precio*descuento/100),2), precio)
			>=60 then '¡OFERTÓN!'
		end as Precio_Final
from vuelos
where desde = 'Sevilla'
  and salida::text like '2021%';

  