CREATE proc [dbo].[ComboBoxPropiedadNoDisponibleProc]
@PersonaId int,
@PersonaTipoId int,
@CondominioId int,
@fecha date
as
if(@PersonaTipoId = 4)
	begin
		SELECT      dbo.PropiedadTable.PropiedadId, dbo.PropiedadTable.PropiedadCodigo, dbo.PropiedadTable.PropiedadHabitaciones, dbo.PropiedadTable.PropiedadCondominioId, dbo.PropiedadTable.PropiedadDescripcion, 
                         dbo.PropiedadTable.PropiedadPrecio, dbo.PropiedadTable.PropiedadInquilinoId, dbo.PropiedadTable.PropiedadActivo, PropiedadTable.PropiedadBanos, PropiedadTable.PropiedadTerraza ,c.CondominioNombre,
						 case when PropiedadTable.PropiedadInquilinoId is NULL then 'Disponible' else 'No disponible' end PropiedadDisponible
		FROM            dbo.PropiedadTable INNER JOIN
								 dbo.CondominioTable c ON dbo.PropiedadTable.PropiedadCondominioId = c.CondominioId
								 left join HistorialAlquiladoTable ha on ha.HistorialAlquiladoPropiedadId = dbo.PropiedadTable.PropiedadId
		WHERE        (dbo.PropiedadTable.PropiedadActivo = 1) AND (c.CondominioPropietarioId = @PersonaId) and (PropiedadTable.PropiedadInquilinoId is not null)
		and not exists(select it.IngresoId from IngresoTable it where it.IngresoActivo = 1 and it.IngresoInquilinoId = ha.HistorialAlquiladoInquilinoId and convert(varchar(7), it.IngresoFecha, 126) = convert(varchar(7), @fecha, 126))
	end
else
	begin
		SELECT      dbo.PropiedadTable.PropiedadId, dbo.PropiedadTable.PropiedadCodigo, dbo.PropiedadTable.PropiedadHabitaciones, dbo.PropiedadTable.PropiedadCondominioId, dbo.PropiedadTable.PropiedadDescripcion, 
                         dbo.PropiedadTable.PropiedadPrecio, dbo.PropiedadTable.PropiedadInquilinoId, dbo.PropiedadTable.PropiedadActivo, PropiedadTable.PropiedadBanos, PropiedadTable.PropiedadTerraza ,c.CondominioNombre,
						 case when PropiedadTable.PropiedadInquilinoId is NULL then 'Disponible' else 'No disponible' end PropiedadDisponible
		FROM            dbo.PropiedadTable INNER JOIN
								 dbo.CondominioTable c ON dbo.PropiedadTable.PropiedadCondominioId = c.CondominioId
								 left join HistorialAlquiladoTable ha on ha.HistorialAlquiladoPropiedadId = dbo.PropiedadTable.PropiedadId
		WHERE        (dbo.PropiedadTable.PropiedadActivo = 1) AND (c.CondominioId = @CondominioId) and (PropiedadTable.PropiedadInquilinoId is not null)
		and not exists(select it.IngresoId from IngresoTable it where it.IngresoActivo = 1 and it.IngresoInquilinoId = ha.HistorialAlquiladoInquilinoId and convert(varchar(7), it.IngresoFecha, 126) = convert(varchar(7), @fecha, 126))
	end