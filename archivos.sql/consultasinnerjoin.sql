use Academico
--Consultas con inner join
	select * from Alumno
	select * from Asignatura
	select * from Nota
--Listar la identificacion, apellidos, nombres, nombre de asignatura, el periodo y la nota definitiva para todos los alumnos ******************
	select Nota.DocIdent as Identificación, Alumno.Apellidos, Alumno.Nombres, Asignatura.Nombre, Nota.Periodo, Nota.Definitiva
	from Alumno inner join Nota
	on Alumno.DocIdent = Nota.DocIdent
	inner join Asignatura
	on Nota.CodAsig = Asignatura.CodAsig
--Otra forma 2 **********************************************************************************************************************************
	select Alumno.DocIdent, Apellidos, Nombres, Asignatura.Nombre, Nota.Periodo, Nota.Definitiva
	from Asignatura inner join Nota
	on Asignatura.CodAsig = Nota.CodAsig
	inner join Alumno
	on Alumno.DocIdent = Nota.DocIdent
--Otra forma 3 **********************************************************************************************************************************
	select Nota.DocIdent, Alumno.Apellidos, Alumno.Nombres, Asignatura.Nombre, Nota.Periodo, Nota.Definitiva
	from Nota inner join Alumno
	on Nota.DocIdent = Alumno.DocIdent
	inner join Asignatura
	on Asignatura.CodAsig = Nota.CodAsig
-- Otra forma con alias de tablas****************************************************************************************************************
	select Al.DocIdent as Identificación, Al.Apellidos, Al.Nombres, Asg.Nombre, N.Periodo, N.Definitiva
	from Alumno as Al inner join Nota as  N
	on Al.DocIdent = N.DocIdent
	inner join Asignatura as Asg
	on Asg.CodAsig = N.CodAsig
	where N.Definitiva > 4
/* Taller de consultas internas inner join*******************************************************************************************************
	Contabilidad BD

6. Todas las líneas de transacciones, por los campos: Número de documento, Código de la
cuenta, Nombre de la cuenta y Valor, emitiendo un subtotal y total por número de
documento (consulte la utilización de la cláusula COMPUTE y COMPUTE BY).

7. El nombre de la cuenta, la cantidad de veces que tuvo transacciones y el promedio del
valor de la transacción.

8. Los nombres de cuentas que no tienen líneas de transacción (consultar y utilizar LEFT JOIN
o RIGHT JOIN).

9. Los códigos de cuenta que no se encuentran en la tabla Cuenta(consultar y utilizar LEFT
JOIN o RIGHT JOIN).

10. Cuánto se ha abonado a las cuentas por pagar (CXP)?
	*/

use Contabilidad
	select * from Comprobante
	select * from Cuenta
	select * from LineaTransacc
	select * from Tercero
	select * from Transaccion
--Comprobante, Transaccion = campo comun NroComp
--Cuenta, lineaTransacc = campor comun CodCuenta
--Tercero = campo comun 'ninguno'
--Transaccion, LineaTransacc = campo comun NroDocumento

--1. Todas las líneas de transacciones, por los campos: Numero de documento, Código de la
--cuenta, Nombre de la cuenta y Valor.
	select LineaTransacc.NroDocumento as Identificación, Cuenta.CodCuenta as Código_Cuenta, Cuenta.Nombre, LineaTransacc.Valor
	from LineaTransacc inner join Cuenta
	on LineaTransacc.CodCuenta = Cuenta.CodCuenta
--*********************************************************************************************************************************************************
--2. Todas las líneas de transacciones, por los campos: Número de documento, Fecha de la
--transacción, Código del comprobante, Código de la cuenta, Nombre de la cuenta y Valor,
--solo si la cuenta empieza por 1.
	select LineaTransacc.NroDocumento as Documento, Transaccion.Fecha, Comprobante.NroComp as Comprobante, Cuenta.CodCuenta as Cuenta, Cuenta.Nombre, LineaTransacc.Valor
	from LineaTransacc inner join Transaccion
	on LineaTransacc.NroDocumento = LineaTransacc.NroDocumento
	inner join Comprobante
	on Comprobante.NroComp = Transaccion.NroComp
	inner join Cuenta
	on Cuenta.CodCuenta = LineaTransacc.CodCuenta
--************************************************************************************************************************************************************
--3. Todas las transacciones, por los campos: Número de documento, Código del
--comprobante, Nombre del comprobante y Fecha.
	select LineaTransacc.NroDocumento as Documento, Comprobante.NroComp as Num_Comprobante, Comprobante.Nombre, Transaccion.Fecha
	from LineaTransacc inner join Transaccion
	on LineaTransacc.NroDocumento = Transaccion.NroDocumento
	inner join Comprobante
	on Comprobante.NroComp = Transaccion.NroComp
--************************************************************************************************************************************************************
--4. Todas las líneas de transacciones, por los campos: Número de documento, Código de la
--cuenta, Nombre de la cuenta y Valor, cuyo valor de transacción exceda de 30000.
	select LineaTransacc.NroDocumento as Documento, LineaTransacc.CodCuenta as Cod_Cuenta, Cuenta.Nombre, LineaTransacc.Valor
	from LineaTransacc inner join Cuenta
	on LineaTransacc.CodCuenta = Cuenta.CodCuenta
	where LineaTransacc.Valor > 30000

--5. Todas las líneas de transacciones, por los campos: Número de documento, Código de la
--cuenta, Nombre de la cuenta y Valor, cuyo valor de transacción este entre 30000 y 50000.
	select LineaTransacc.NroDocumento as Documento, Cuenta.CodCuenta, Cuenta.Nombre, LineaTransacc.Valor
	from LineaTransacc inner join Cuenta
	on LineaTransacc.CodCuenta = Cuenta.CodCuenta
	where LineaTransacc.Valor >= 300000 and LineaTransacc.Valor <= 500000


		select * from Comprobante
	select * from Cuenta
	select * from LineaTransacc
	select * from Tercero
	select * from Transaccion