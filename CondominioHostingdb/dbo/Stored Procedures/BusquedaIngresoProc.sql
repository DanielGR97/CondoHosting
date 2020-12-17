CREATE proc BusquedaIngresoProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		SELECT        dbo.IngresoTable.IngresoId, dbo.IngresoTable.IngresoDescripcion, dbo.IngresoTable.IngresoTipoIngresoId, dbo.IngresoTable.IngresoFecha, dbo.IngresoTable.IngresoCantidad, dbo.IngresoTable.IngresoActivo, 
                         dbo.IngresoTable.CondominioId, t.TipoIngresoDescripcion, c.CondominioNombre
		FROM            dbo.IngresoTable left join
						CondominioTable c on IngresoTable.CondominioId = c.CondominioId left join
						TipoIngresoTable t on IngresoTable.IngresoTipoIngresoId = t.TipoIngresoId
		WHERE        (dbo.IngresoTable.IngresoActivo = 1) AND (c.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		SELECT        dbo.IngresoTable.IngresoId, dbo.IngresoTable.IngresoDescripcion, dbo.IngresoTable.IngresoTipoIngresoId, dbo.IngresoTable.IngresoFecha, dbo.IngresoTable.IngresoCantidad, dbo.IngresoTable.IngresoActivo, 
                         dbo.IngresoTable.CondominioId, t.TipoIngresoDescripcion, c.CondominioNombre
		FROM            dbo.IngresoTable left join
						CondominioTable c on IngresoTable.CondominioId = c.CondominioId left join
						TipoIngresoTable t on IngresoTable.IngresoTipoIngresoId = t.TipoIngresoId
		WHERE        (dbo.IngresoTable.IngresoActivo = 1) AND (c.CondominioId = @CondominioId)
	end