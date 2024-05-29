-- Empresa          :  FastFood Restaurant
-- Software         :  Servicio de Comida R�pida
-- DBMS             :  SQL Server
-- Base de Datos    :  FastFood
-- Procedimiento    :  usp_InsertaEmpleado
-- Proceso          :  Registra un nuevo Empleado
-- Programado por   :  Eric G. Coronel Castillo
-- Valor de Retorno :   0 Exito
--                     -1 Error en la base de datos
--		       -2 No se acepta valores nulos
--		       -3 No existe el contador de empleados


Create Procedure usp_InsertaEmpleado
	@Apellido   VarChar(20),
	@Nombre     VarChar(20),
	@Direccion  VarChar(60),
	@Telefono   VarChar(8),
	@Contrase�a VarChar(10),
	@Codigo     Char(6) OUTPUT
AS
Declare @Cont Integer, @VarError Int, @VarRowCount Int

-- Verificar Valores Nulos
If @Apellido Is Null Or @Nombre Is Null 
	Or @Contrase�a Is Null

	Return -2

-- Leer el valor del contador de empleados
Begin Transaction	
	Update Parametro
		Set @Cont = Valor, Valor = Valor + 1
		Where Campo = 'Empleado'
	Select @VarError = @@Error, @VarRowCount = @@RowCount
	If @VarError <> 0
	Begin
		Rollback Transaction
		Return -1
	End
	If @VarRowCount = 0
	Begin
		Rollback Transaction
		Return -3
	End
Commit Transaction
-- Genera el c�digo del empleado
Set @Codigo = 'E' + Right('00000'+Convert(VarChar(4),@Cont),5)
-- Inserta el nuevo registro
Begin Transaction
	Insert Into Empleado(IdEmpleado,ApeEmpleado,NomEmpleado,
		DirEmpleado, TelEmpleado, Contrase�a )
	Values(@Codigo,@Apellido,@Nombre,@Direccion,@Telefono,@Contrase�a)
	If @@Error <> 0
	Begin
		Rollback Transaction
		Return -1
	End
Commit Transaction
Return 0
GO


-- Script de prueba
Declare @IdEmp Char(6), @Cod Int
exec @Cod = usp_InsertaEmpleado 'Torres', 'Juan', 'Los Olivos', 
	'567-1234', 'ert', @IdEmp OutPut
Select @Cod, @IdEmp
