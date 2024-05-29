-- Empresa        :  FastFood Restaurant
-- Producto       :  Servicio de Comida R�pida
-- Software       :  Sistema de Atenci�n al P�blico (SAP)
-- DBMS           :  SQL Server
-- Base de Datos  :  FastFood
-- Script         :  Crea la vista v_Articulos
-- Programado por :  Eric G. Coronel Castillo
--                   Tel�fono: 521-4991
--                   email:    gcoronel@uni.edu.pe

CREATE VIEW v_Articulos(IdCategoria,NomCategoria,
	IdArticulo,NomArticulo, PreArticulo)
AS
	SELECT	C.IdCategoria,C.NomCategoria,
		A.IdArticulo,A.NomArticulo,A.PreArticulo
	FROM Categoria C INNER JOIN Articulo A
	ON C.IdCategoria = A.IdCategoria
GO

Select * From v_articulos