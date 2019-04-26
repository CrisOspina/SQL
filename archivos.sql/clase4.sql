use Academico
--Subconsultas
--Listar las notas de Andrea Betancourt
select * from Alumno
select * from Nota
	where DocIdent in --campo comun*********************
	(Select DocIdent from Alumno -- campo comun**************
	where Apellidos = 'Betancourt' and Nombres = 'Andrea')

--Listar la notas de la asignatura SQL
select * from Nota
	where CodAsig in --campo comun**********************
	(select CodAsig from Asignatura -- campo comun****************
	where Nombre = 'SQL')
select * from Asignatura

--Cuales son los profesores que dictan SQL
select * from Profesor
select * from AsignatXProfesor
select * from Asignatura

select * from Profesor
	where DocIdentP in
	(select DocIdentP from AsignatXProfesor where CodAsig in
	(select CodAsig from Asignatura where Nombre = 'SQL'))

--Cuantos profesores dictan SQL 
select Count(DocIdentP) as Cantidad_Profesor from AsignatXProfesor 
	where CodAsig in
	(select CodAsig from Asignatura where Nombre ='SQL')

--Cuantas asignaturas pierde Julian Gomez
select Count(DocIdent) as Cantidad_asignatura from Nota
	where DocIdent in
	(select DocIdent from Alumno where Nombres ='Julian' and Apellidos='Gomez')
	and Definitiva < 3

--Cual es la definitiva de Julian Gomez en SQL
select Definitiva from Nota
	where DocIdent in
	(select DocIdent from Alumno where Apellidos='Gomez' and Nombres='Julian')
	and CodAsig in
	(select CodAsig from Asignatura where Nombre='SQL')

--Cuales asignaturas pierde Pablo Perez
select * from Asignatura
	where CodAsig in
	(select CodAsig from Nota where DocIdent in
	(select DocIdent from Alumno where Apellidos='Perez' and Nombres ='Pablo') and Definitiva < 3)
