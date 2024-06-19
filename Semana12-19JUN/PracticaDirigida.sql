-- Paso 1
create database perudev;
go

use perudev;
go


alter database perudev
set recovery FULL;
);
	begin tran;
	insert into perudev..test(dato) values('EGCC: Backup de Base de Datos');
	commit tran;
	set @k = @k + 1;
end;
with
	name = 'BakBD',
	description = 'Backup completo de la base de datos';
	begin tran;
	insert into perudev..test(dato) values('Actividades del lunes');
	commit tran;
	set @k = @k + 1;
end;
with
	name = 'BakDif01',
	description = 'Backup diferencial del lunes';
	begin tran;
	insert into perudev..test(dato) values('Actividades del martes');
	commit tran;
	set @k = @k + 1;
end;
with
	name = 'BakDif02',
	description = 'Backup diferencial del martes';
	begin tran;
	insert into perudev..test(dato) values('Actividades del miercoles');
	commit tran;
	set @k = @k + 1;
end;
with
	name = 'BakLog',
	description = 'Backup del log.'