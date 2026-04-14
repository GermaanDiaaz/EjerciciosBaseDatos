select *,
 	Coalesce(round(precio-(precio*descuento/100),2), precio) as Precio_Final,
	Coalesce(round((precio*descuento/100),2), 0) as Ahorro
	 from vuelos
where salida::text like '2019-12%'
   and desde in('Sevilla', 'Málaga')
   and hasta in('Madrid', 'Barcelona')
   and precio >=80;


select id, desde, hasta, precio,
	upper(left(desde, 3)) || '-' || upper(left(hasta, 3)) || '-' || 
			right('0000' || cast(id as text), 4) as codigo_ruta
from vuelos
where salida::text like '2020%'
  and desde in ('Madrid', 'Barcelona')
  and hasta in ('París', 'Londres')
  
  and (descuento is null);


select *,
       case
           when descuento is null or descuento = 0 then 'sin_descuento'
           when descuento >= 30 then 'descuento_alto'
           else 'descuento_bajo'
       end as tipo_descuento,
       round(precio * (1 - coalesce(descuento, 0) / 100.0), 2) as precio_final
from vuelos
where salida::text like '2020-03%'
  and (desde in ('Londres', 'París') or hasta in ('Sevilla', 'Málaga'))
  and precio between 60 and 300
  and ((descuento > 0) or (precio > 200));


select count(*) as total_vuelos,
       max(precio) as precio_maximo,
       min(precio) as precio_minimo,
       round(avg(precio), 2) as precio_medio,
       avg(coalesce(descuento, 0)) as descuento_medio
from vuelos
where salida::text like '2020%'
  and desde in ('Madrid', 'Barcelona', 'Sevilla', 'Málaga')
  and precio between 60 and 500
  and desde != hasta;



select id, desde, hasta, precio,
       upper(trim(desde)) as origen_limpio,
       upper(trim(hasta)) as destino_limpio,
       round(precio, -1) as precio_redondeado,
       abs(precio - round(precio, -1)) as diferencia_absoluta
from vuelos
where salida::text like '2019%'
  and (hasta like 'B%' or hasta like 'Á%')
  and coalesce(descuento, 0) >= 10
  and precio < 200;


  