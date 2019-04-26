-- esto es un comentario de una linea 
/* Comentario
de varial 
lineas*/
-- Activar/Contextualizar/Abrir base de datos ACADEMICO
Use Academico
/*
Recuperacion de Datos: se hace a traves de ña instruccion.
Sintaxis (básica):
SELECT [TOP n] <lista_columnas> FROM <tabla> (s)>
[WHERE <condición>]
[GROUP BY >lista_columnas_agrupar>]
[HAVING <condición_agrupación>]
[ORDER BY <lista_columnas> ASC/DESC]
*/
-- LISTAR TODOS LOS DATOS DE TODOS LOS ALUMNOS
select * from Alumno 
-- Recuperar la identificación los apellidos,Nombres,Ciudad,Email y valor cuata de todos los alumnos
select Docident,Apellidos,Nombres,Ciudad,Email,vlrCuota from Alumno
Select Apellidos,Nombres,DocIdent,VlrCuota,Email,Ciudad from Alumno
-- lISTAR LOS ALUMNOS DE Medellin
Select * from Alumno 
Where Ciudad= 'Medellin'
-- listar los alumnos que no son de Medellin 
Select * from Alumno where Ciudad <> 'Medellin'
select * from Alumno where Ciudad !='Medellin' 
Select * from Alumno Where not Ciudad = 'Medellin'
-- listar las alumnas de Medellin con una cuota superior a 80000
select * From Alumno where Genero = 'f' And Ciudad= 'Medellin' And VlrCuota>80000
-- Listar los alumnos de Medellin o de Bogota, solo si la cuota es inferior a o igual a 80000
Select * From Alumno where (Ciudad ='Medellin' or Ciudad = 'Bogota') and VlrCuota <=80000
-- Con la cláusura IN 
select * from Alumno where VlrCuota<=80000 and Ciudad IN ('Medellin','bogota')
Select * from alumno where Ciudad in ('Medellin','Bogota') And VlrCuota<=80000
-- Campos Calculados y/o alias de campos
-- Alias: se aplica a campos que son ambiguos para los usuarios finales
select DocIdent As 'documento de Identidad',Apellidos,Nombres,Fecha_Cacimiento=fechaNacim,
VlrCuota as 'Valor Cuota',Genero as Sexo From Alumno where Genero = 'F'
-- Campos calculados
/*Listar los datos de los alumnos y una columna calculada llamada valor_descuento que contendrá
el 10% del valor de la cuota*/
select *,valor_Descuento=vlrCuota*10/100 From Alumno
--Ordenación de datos 
-- Listar los alumnos ordenados por Apellidos, en forma ascendente 
select * from Alumno order by Apellidos
-- Listar los alumnos de Medellin ordenados por calor cuota, en forma descendente 
select * from Alumno where Ciudad = 'Medellin ' order By VlrCuota Desc
-- Listar los 3 alumnos que menos pagan en cuota 
select top 3 * from Alumno Order by VlrCuota
-- Listar los dos alumnos que mas pagan valor cuota 
select top 2 * From Alumno Order By VlrCuota desc

select Identificacion=docident,apellidos,nombres,VlrCuota as vlrvalor_cuota
from alumno where VlrCuota > 90000 order by Identificacion 
