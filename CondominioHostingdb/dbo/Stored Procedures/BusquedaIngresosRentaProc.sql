


create proc [dbo].[BusquedaIngresosRentaProc]
@PersonaId int,
@PersonaTipoId int,
@CondominioId int,
@Fecha date
as
if(@PersonaTipoId = 4)
	begin
		SELECT        dbo.IngresoTable.IngresoId, dbo.IngresoTable.IngresoDescripcion, 
					  dbo.IngresoTable.IngresoTipoIngresoId, dbo.IngresoTable.IngresoFecha, 
					  dbo.IngresoTable.IngresoCantidad, dbo.IngresoTable.IngresoActivo, 
					  dbo.IngresoTable.CondominioId, t.TipoIngresoDescripcion, c.CondominioNombre, p.PersonaNombre, p.PersonaApellido
		FROM          dbo.IngresoTable 
					  left join CondominioTable c on IngresoTable.CondominioId = c.CondominioId 
					  left join TipoIngresoTable t on IngresoTable.IngresoTipoIngresoId = t.TipoIngresoId
					  left join PersonaTable p on p.PersonaId = dbo.IngresoTable.IngresoInquilinoId
		WHERE        (dbo.IngresoTable.IngresoActivo = 1) 
		 and (dbo.IngresoTable.IngresoInquilinoId is not null) 
		 and (convert(varchar(7), dbo.IngresoTable.IngresoFecha, 126) = convert(varchar(7), @Fecha, 126) ) 
		 AND (c.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		SELECT        dbo.IngresoTable.IngresoId, dbo.IngresoTable.IngresoDescripcion, 
					  dbo.IngresoTable.IngresoTipoIngresoId, dbo.IngresoTable.IngresoFecha, 
					  dbo.IngresoTable.IngresoCantidad, dbo.IngresoTable.IngresoActivo, 
					  dbo.IngresoTable.CondominioId, t.TipoIngresoDescripcion, c.CondominioNombre, p.PersonaNombre, p.PersonaApellido
		FROM          dbo.IngresoTable 
					  left join CondominioTable c on IngresoTable.CondominioId = c.CondominioId 
					  left join TipoIngresoTable t on IngresoTable.IngresoTipoIngresoId = t.TipoIngresoId
					  left join PersonaTable p on p.PersonaId = dbo.IngresoTable.IngresoInquilinoId
		WHERE        (dbo.IngresoTable.IngresoActivo = 1) 
		 and (dbo.IngresoTable.IngresoInquilinoId is not null) 
		 and (convert(varchar(7), dbo.IngresoTable.IngresoFecha, 126) = convert(varchar(7), @Fecha, 126) )  
		 AND (c.CondominioId = @CondominioId)
	end