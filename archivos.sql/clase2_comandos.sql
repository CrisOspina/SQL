use Academico
select * from Alumno
/*Manejo de null****************************************************************************
	Is Null: Es o esta nulo (vacio)
	Not is Null: No es o no esta nulo
*/
--Listar los alumnos que no tienen teléfono************************************************
select * from Alumno
where Telefono Is Null

--Listar los  alumnos que poseen telefono*************************************************
select * from Alumno
where Telefono Is Not Null

--Listar los alumnos que no tienen telefono ni email*******************************************
select * from Alumno
where Telefono Is Null and Email Is Null

--Cambiar el Null por palabras o campo vacio********************************************************
select DocIdent, Apellidos, Nombres, IsNull(Telefono,'No tiene teléfono') As Telefono from Alumno
select DocIdent, Apellidos, Nombres, IsNull(Telefono,'') As Telefono from Alumno

/*Manejo de fechas*********************************************************************************
	Formato ANSI: yyyymmdd
	Con slash o guión:
		Set DateFormat mdy/dmy/ymd
	Funciones de fecha:
	GetDate(): Extrae la fecha del sistema
	Month(): Extrae el número del mes de una fecha
	Year(): Extrae el número del año de una fecha
*/
select * from Alumno
select GETDATE()
select Year(GetDate())
select Month(GetDate())
select Day(GetDate())

--Listar los alumnos mayores de edad*******************************************************
--Con formato ANSI*************************************************************************
select * from Alumno
where FechaNacim < '20001231'

--Con slash o guion
Set DateFormat mdy
select * from Alumno
where FechaNacim < '12/31/2000'

-- Con GetDate()
select * from Alumno
where Year(GetDate())-Year(FechaNacim)>=18

--Listar los alumnos con edad entre 20 y 35 años
select * from Alumno
where Year(GetDate())-Year(FechaNacim) >= 20 and Year(GetDate())-Year(FechaNacim) <= 35

select * from Alumno
where Year(GetDate())-Year(FechaNacim) Between 20 and 35

--Agregar edad a la tabla Alumno para esta necesidad
select *,Edad=Year(GetDate())-Year(fechaNacim) from Alumno
where Year(GetDate())-Year(fechaNacim) Between 20 and 35

--Listar los alumnos que cumplen años en mayo
select Apellidos, Nombres, dia = day(FechaNacim) From Alumno
where Month(FechaNacim) = 5

--listar los alumnos de junio
select Nombres, Apellidos, mes = month(FechaNacim) from Alumno
where month(FechaNacim) = 6

--Ejercicios******************************************************************************************************
--Los alumnos que sean mujeres mayores de edad
select * from Alumno
where Year(GetDate())-Year(FechaNacim)>=18 and Genero = 'f'

--Los alumnos que sean mayores de edad, tengan una cuota superior a 55000 y sean de la ciudad de Medellín
select * from Alumno
where Year(GetDate()) - Year(FechaNacim) >=18 and VlrCuota > 55000 and Ciudad = 'medellin'

--El alumno de mayor edad
select top 1 * from Alumno 
where FechaNacim is not null order by FechaNacim asc

--Los 3 primeros alumnos de menor edad
select top 5 * from Alumno
order by FechaNacim desc

/*	La identificación, apellidos, nombres, teléfono, edad, ciudad, mes de nacimiento y día de nacimiento, solo para los alumnos que
	tengan entre 15 años y 30 años*/
select DocIdent, Apellidos, Nombres, IsNull(Telefono,'') As Telefono, Edad=year(getdate())-year(FechaNacim), Ciudad, Mes=month(FechaNacim), Dia=day(FechaNacim) from Alumno
where year(getDate()) - year(FechaNacim) >= 15 and year(getdate())-year(FechaNacim) <= 30

/*Clausula Like (Patrón de busqueda aproximada)**************************************************************************************************
	comodines:
		%: Representa varios caracteres
		_(Guion subrayado): Representa un caracter
*/
--Ejemplos
--Listar los alumnos cuyo documento comienza en 1
select * from Alumno
where DocIdent like '1%'

--Listar alumnos donde la identificacion termine en 5
select * from Alumno
where DocIdent like '%5'
--***********************************************************************************************************************************************




