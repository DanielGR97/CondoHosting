create proc BusquedaGastoProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		SELECT        dbo.GastoTable.GastoId, dbo.GastoTable.GastoDescripcion, dbo.GastoTable.GastoTipoGastoId, dbo.GastoTable.GastoFecha, dbo.GastoTable.GastoCantidad, dbo.GastoTable.GastoActivo, 
                         dbo.GastoTable.GastoPropiedadId, dbo.GastoTable.GastoInstalacionId, dbo.GastoTable.GastoServicioId, dbo.GastoTable.CondominioId, dbo.TipoGastoTable.TipoGastoDescripcion, 
                         dbo.CondominioTable.CondominioNombre
		FROM            dbo.GastoTable INNER JOIN
								 dbo.TipoGastoTable ON dbo.GastoTable.GastoTipoGastoId = dbo.TipoGastoTable.TipoGastoId LEFT OUTER JOIN
								 dbo.CondominioTable ON dbo.GastoTable.CondominioId = dbo.CondominioTable.CondominioId
		WHERE        (dbo.GastoTable.GastoActivo = 1) AND (CondominioTable.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		SELECT        dbo.GastoTable.GastoId, dbo.GastoTable.GastoDescripcion, dbo.GastoTable.GastoTipoGastoId, dbo.GastoTable.GastoFecha, dbo.GastoTable.GastoCantidad, dbo.GastoTable.GastoActivo, 
                         dbo.GastoTable.GastoPropiedadId, dbo.GastoTable.GastoInstalacionId, dbo.GastoTable.GastoServicioId, dbo.GastoTable.CondominioId, dbo.TipoGastoTable.TipoGastoDescripcion, 
                         dbo.CondominioTable.CondominioNombre
		FROM            dbo.GastoTable INNER JOIN
								 dbo.TipoGastoTable ON dbo.GastoTable.GastoTipoGastoId = dbo.TipoGastoTable.TipoGastoId LEFT OUTER JOIN
								 dbo.CondominioTable ON dbo.GastoTable.CondominioId = dbo.CondominioTable.CondominioId
		WHERE        (dbo.GastoTable.GastoActivo = 1) AND (CondominioTable.CondominioId = @CondominioId)
	end