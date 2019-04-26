use Academico
/*funciones de agregado 
	count(<campo>): contar registros 
	sum(<campo_numerico>):sumar 
	avg(<campo_numerico>):promediar
	max(<campo_numerico>): mayor valor
	min(<campo_numerico>): menor valor
*/
-- listar la cantidad de alumnos
select count(DocIdent) as cantidad_alumnos from alumno

-- cuantos alumnos tienen email
select count(email) as cantidad_alumnos from alumno 
	where email is not null

-- cuantos alumnos no tienen email
select count(DocIdent) as cantidad_alumnos from alumno 
	where email is null

-- cuantos alumnos pagan mas de 70000 en la cuota?
select cantidad_alumnos = count(DocIdent) from alumno 
	where VlrCuota>70000 

-- cual es valor total de cuotas por mes
select sum(vlrcuota) as total_cuotas_mensuales from alumno

-- cual es valor total de cuotas por mes en tres meses
select sum(vlrcuota)*3 as total_cuotas_mensuales from alumno

-- promediar el valor de la cuota
select promedio_cuota = avg(vlrcuota) from alumno 

-- cual es el promedio de cuota de las mujeres de medellin 
select avg(vlrcuota) as promedio_cuota from alumno 
	where genero='f' and ciudad='medellin'

-- listar la cantidad de alumnos y el promedio de la cuotas de las mujeres
select count(docident) as cantidad, promedio_cuota=avg(vlrcuota)from alumno 
	where genero = 'f' 

-- cual es el valor de la cuota mas alta?
select max(vlrcuota) as cuota_mas_alta from alumno
 
--cual es el alumno que tiene la cuota mas alta?
select top 3 * from alumno 
	order by vlrcuota desc 

-- cual es la cuota mas baja 
select Min(vlrcuota) as cuota_mas_baja from alumno

-- cual es el alumno que tiene la cuota mas baja
select top 1 * from alumno 
	order by vlrcuota

 /* agrupacion de registros: se hace en tablas donde hayan campos que la informacion se repite
	group by: agrupar regis
	having: condicion para registros agrupados 
*/

-- listar la cantidad de alumnos por ciudad
select count(docident) as cantidad,ciudad from alumno
	group by Ciudad 
select ciudad,count(docident) as cantidad,ciudad from alumno 
	group by Ciudad 

-- listar la cantidad de alumnos por sexo
select genero,count(docident) as cantidad from alumno
	group by genero having genero is not null
select case genero when 'f' then 'Mujeres'
		when 'm' then 'Hombres'
		end as Sexo, count(docident) as cantidad from alumno 
		group by genero having genero is not null 

-- listar la cantidad de alumno por ciudad y por genero, solo si la cantidad ecxede a 3
select count(docident) as cantidad,ciudad,genero from alumno
	group by ciudad,genero 
	having count(docident)>3 and genero is not null