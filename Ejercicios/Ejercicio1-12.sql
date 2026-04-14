select *
from comprador
where nombre ilike'G_e%';

select id_inmueble, provincia, precio
from inmueble
where (precio between 80000 and 100000) and tipo_operacion= 'Venta'
order by precio desc;


select *
from inmueble
where superficie <50
 and ((precio>900 and tipo_operacion= 'Alquiler')
 or(precio>75000 and tipo_operacion= 'Venta'));

select *
from inmueble
where provincia = 'Granada'
  and ((id_inmueble%2=0 and tipo_operacion= 'Venta')
  or (tipo_inmueble%2=1 and tipo_operacion= 'Alquiler'))
order by id_inmueble desc;