create proc BusquedaInstalacionProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		SELECT        dbo.InstalacionTable.InstalacionId, dbo.InstalacionTable.InstalacionTipoId, dbo.InstalacionTable.InstalacionCondominioId, dbo.InstalacionTable.InstalacionDescripcion, 
                         dbo.InstalacionTable.InstalacionHorarioInicial, dbo.InstalacionTable.InstalacionHorarioFinal, dbo.InstalacionTable.InstalacionOcupado, dbo.InstalacionTable.InstalacionActivo, 
                         dbo.TipoInstalacionTable.TipoInstalacionDescripcion, dbo.CondominioTable.CondominioNombre
		FROM            dbo.InstalacionTable INNER JOIN
                         dbo.TipoInstalacionTable ON dbo.InstalacionTable.InstalacionTipoId = dbo.TipoInstalacionTable.TipoInstalacionId INNER JOIN
                         dbo.CondominioTable ON dbo.InstalacionTable.InstalacionCondominioId = dbo.CondominioTable.CondominioId
		WHERE        (dbo.InstalacionTable.InstalacionActivo = 1) and (CondominioTable.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		SELECT        dbo.InstalacionTable.InstalacionId, dbo.InstalacionTable.InstalacionTipoId, dbo.InstalacionTable.InstalacionCondominioId, dbo.InstalacionTable.InstalacionDescripcion, 
                         dbo.InstalacionTable.InstalacionHorarioInicial, dbo.InstalacionTable.InstalacionHorarioFinal, dbo.InstalacionTable.InstalacionOcupado, dbo.InstalacionTable.InstalacionActivo, 
                         dbo.TipoInstalacionTable.TipoInstalacionDescripcion, dbo.CondominioTable.CondominioNombre
		FROM            dbo.InstalacionTable INNER JOIN
								 dbo.TipoInstalacionTable ON dbo.InstalacionTable.InstalacionTipoId = dbo.TipoInstalacionTable.TipoInstalacionId INNER JOIN
								 dbo.CondominioTable ON dbo.InstalacionTable.InstalacionCondominioId = dbo.CondominioTable.CondominioId
		WHERE        (dbo.InstalacionTable.InstalacionActivo = 1) and (CondominioTable.CondominioId = @CondominioId)
	end