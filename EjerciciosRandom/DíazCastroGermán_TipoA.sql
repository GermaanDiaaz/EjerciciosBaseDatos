-- Ejercicio1
select ca.nombre, count(p.id) as num_productos, round(avg(pvp), 2) as precio_medio
from categoria ca
	join producto p on(p.id_categoria = ca.id)
group by ca.nombre
having round(avg(pvp), 2) > 20
order by precio_medio desc;


--Ejercicio2
select v.id, v.fecha
from venta v
	join lineaventa l on(v.id = l.id_venta)
where (precio_unitario*cantidad - (1-coalesce(descuento, 0))) > (
	select avg(precio_unitario*cantidad - (1-coalesce(descuento, 0)))
	from venta v
		join lineaventa l on(v.id = l.id_venta)
);


--Ejercicio 3
select cl.nombre, cl.apellidos
from cliente cl
	join venta v on(v.id_cliente = cl.id)
	join lineaventa l on(v.id = l.id_venta)
	join producto p on(p.id = l.id_producto)
	join categoria ca on(ca.id = p.id_categoria)
group by cl.nombre, cl.apellidos, ca.nombre, cl.id
having ca.nombre in(
	select ca.nombre
	from categoria ca
		join producto p on(p.id_categoria = ca.id)
		join lineaventa l on(p.id = l.id_producto)
		join venta v on(v.id = l.id_venta)
		join cliente cl2 on(v.id_cliente = cl2.id)
	where ca.nombre = 'Quesos y lácteos'
	  and cl.id = cl2.id
);


--Ejercicio 4
select p.nombre, p.pvp, ca.nombre
from producto p
	join categoria ca on(ca.id = p.id_categoria)
where pvp > (
	select avg(pvp)
	from producto p
		join categoria ca2 on(ca2.id = p.id_categoria)
	where ca.nombre = ca2.nombre
);


--Ejercicio 5
select cl.id, count(distinct(p.id))
from cliente cl
	join venta v on(v.id_cliente = cl.id)
	join lineaventa l on(v.id = l.id_venta)
	join producto p on(p.id = l.id_producto)
	join categoria ca on(ca.id = p.id_categoria)
group by cl.id
having count(ca.nombre) >2
  and (
	
)
order by count(distinct(p.id));



select *
from cliente


select *
from producto;


select *
from lineaventa;


select *
from venta;


select *
from categoria;