


create proc ComboBoxReferidosProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
	SELECT        dbo.PersonaTable.PersonaId, dbo.PersonaTable.PersonaNombre, dbo.PersonaTable.PersonaApellido, dbo.PersonaTable.PersonaDocumento, dbo.PersonaTable.PersonaTelefono, 
								 dbo.PersonaTable.PersonaCorreo, dbo.PersonaTable.PersonaSexoId, dbo.PersonaTable.PersonaDireccion, dbo.PersonaTable.PersonaRNC, dbo.PersonaTable.PersonaTipoId, dbo.PersonaTable.PersonaRolId, 
								 dbo.PersonaTable.PersonaServicio, dbo.PersonaTable.PersonaCompañia, dbo.PersonaTable.PersonaNacionalidad, dbo.PersonaTable.PersonaActivo, dbo.PersonaTable.PersonaContra, 
								 PersonaTable.PersonaSueldo, PersonaTable.PersonaFechaEntrada, PersonaTable.PersonaCondominioId, dbo.RolTable.Descripcion, c.CondominioNombre
		FROM            dbo.PersonaTable INNER JOIN
								 dbo.RolTable ON dbo.PersonaTable.PersonaRolId = dbo.RolTable.RolId
								 left join CondominioTable c on PersonaTable.PersonaCondominioId = c.CondominioId
		WHERE        (dbo.PersonaTable.PersonaActivo = 1)
		 AND (c.CondominioPropietarioId = @PersonaId)
	end
else
	begin
	SELECT        dbo.PersonaTable.PersonaId, dbo.PersonaTable.PersonaNombre, dbo.PersonaTable.PersonaApellido, dbo.PersonaTable.PersonaDocumento, dbo.PersonaTable.PersonaTelefono, 
								 dbo.PersonaTable.PersonaCorreo, dbo.PersonaTable.PersonaSexoId, dbo.PersonaTable.PersonaDireccion, dbo.PersonaTable.PersonaRNC, dbo.PersonaTable.PersonaTipoId, dbo.PersonaTable.PersonaRolId, 
								 dbo.PersonaTable.PersonaServicio, dbo.PersonaTable.PersonaCompañia, dbo.PersonaTable.PersonaNacionalidad, dbo.PersonaTable.PersonaActivo, dbo.PersonaTable.PersonaContra, 
								 PersonaTable.PersonaSueldo, PersonaTable.PersonaFechaEntrada, PersonaTable.PersonaCondominioId, dbo.RolTable.Descripcion, c.CondominioNombre
		FROM            dbo.PersonaTable INNER JOIN
								 dbo.RolTable ON dbo.PersonaTable.PersonaRolId = dbo.RolTable.RolId
								 left join CondominioTable c on PersonaTable.PersonaCondominioId = c.CondominioId
		WHERE        (dbo.PersonaTable.PersonaActivo = 1)
		 AND (c.CondominioId = @CondominioId)
	end