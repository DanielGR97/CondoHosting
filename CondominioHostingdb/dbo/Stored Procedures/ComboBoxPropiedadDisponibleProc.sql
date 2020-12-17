create proc ComboBoxPropiedadDisponibleProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		SELECT        dbo.PropiedadTable.PropiedadId, dbo.PropiedadTable.PropiedadCodigo, dbo.PropiedadTable.PropiedadHabitaciones, dbo.PropiedadTable.PropiedadCondominioId, dbo.PropiedadTable.PropiedadDescripcion, 
                         dbo.PropiedadTable.PropiedadPrecio, dbo.PropiedadTable.PropiedadInquilinoId, dbo.PropiedadTable.PropiedadActivo, PropiedadTable.PropiedadBanos, PropiedadTable.PropiedadTerraza ,c.CondominioNombre,
						 case when PropiedadTable.PropiedadInquilinoId is NULL then 'Disponible' else 'No disponible' end PropiedadDisponible
		FROM            dbo.PropiedadTable INNER JOIN
								 dbo.CondominioTable c ON dbo.PropiedadTable.PropiedadCondominioId = c.CondominioId
		WHERE        (dbo.PropiedadTable.PropiedadActivo = 1) and (c.CondominioPropietarioId = @PersonaId) and (PropiedadTable.PropiedadInquilinoId is null)
	end
else
	begin
		SELECT        dbo.PropiedadTable.PropiedadId, dbo.PropiedadTable.PropiedadCodigo, dbo.PropiedadTable.PropiedadHabitaciones, dbo.PropiedadTable.PropiedadCondominioId, dbo.PropiedadTable.PropiedadDescripcion, 
                         dbo.PropiedadTable.PropiedadPrecio, dbo.PropiedadTable.PropiedadInquilinoId, dbo.PropiedadTable.PropiedadActivo, PropiedadTable.PropiedadBanos, PropiedadTable.PropiedadTerraza ,c.CondominioNombre,
						 case when PropiedadTable.PropiedadInquilinoId is NULL then 'Disponible' else 'No disponible' end PropiedadDisponible
		FROM            dbo.PropiedadTable INNER JOIN
								 dbo.CondominioTable c ON dbo.PropiedadTable.PropiedadCondominioId = c.CondominioId
		WHERE        (dbo.PropiedadTable.PropiedadActivo = 1) AND (c.CondominioId = @CondominioId) and (PropiedadTable.PropiedadInquilinoId is null)
	end