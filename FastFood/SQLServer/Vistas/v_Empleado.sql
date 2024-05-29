-- Empresa        :  FastFood Restaurant
-- Producto       :  Servicio de Comida R�pida
-- Software       :  Sistema de Atenci�n al P�blico (SAP)
-- DBMS           :  SQL Server
-- Base de Datos  :  FastFood
-- Script         :  Crea la vista v_Empleado
-- Programado por :  Eric G. Coronel Castillo
--                   Tel�fono: 521-4991
--                   email:    gcoronel@uni.edu.pe

Create View v_Empleado(IdEmpleado, Nombre)
As
	Select	IdEmpleado,
		ApeEmpleado + ', ' + NomEmpleado
	From Empleado
Go

Select * From v_Empleado
Go