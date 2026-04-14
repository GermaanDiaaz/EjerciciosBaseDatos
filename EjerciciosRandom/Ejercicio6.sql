
Select avg(temperatura_media)
from climatologia
where provincia in('Sevilla', 'Jaén', 'Córdoba', 'Málaga', 'Granada', 'Almería', 'Cádiz', 'Huelva')
  and starts_with(estacion, 'Al')
  and starts_with(fecha::text, '2019-05');


Select fecha, estacion, temperatura_media, 
	case 
  		when precipitacion_total >=50 then 'CHUZOS DE PUNTA' 
		when (precipitacion_total >=40 and precipitacion_total<50) then 'A CÁNTAROS' 
		when (precipitacion_total >=25 and precipitacion_total<40) then 'MUCHA LLUVIA' 
		when (precipitacion_total >=10 and precipitacion_total<25) then 'FALTA LE HACÍA AL CAMPO' 
		when (precipitacion_total <10 and precipitacion_total>0)then 'HA LLOVIDO POCO' 
		when (precipitacion_total =0 or precipitacion_total is null) then 'NO HA LLOVIDO' 		
		end as precipitacion_total
from climatologia
where provincia = 'Jaén'
  and starts_with(fecha::text, '2019-11')
order by fecha asc, estacion asc;


  
Select *
from climatologia;