
select provincia, anio, mujeres as Num_Mujeres, hombres+mujeres as Poblacion_Total, 
	ROUND((mujeres::numeric/(mujeres+hombres)) *100, 2)::text || '%' as Porcentaje_Mujeres
from demografia_basica
where provincia in('Huesca', 'Zaragoza', 'Teruel')
  and (anio >=2010 and anio <=2020)
order by anio desc;

select max(round(((mujeres::numeric / (hombres+mujeres) )*100), 2))::text || '%' as porcentaje_mujeres
from demografia_basica
where provincia in('Huesca', 'Zaragoza', 'Teruel')
  and anio between 2010 and 2020;