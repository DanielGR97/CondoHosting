CREATE proc BusquedaInquilinoProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		SELECT        PersonaId, PersonaNombre, PersonaApellido, PersonaDocumento, PersonaTelefono, PersonaCorreo, PersonaSexoId, PersonaDireccion, PersonaRNC, PersonaTipoId, PersonaRolId, PersonaServicio, 
							 PersonaCompañia, PersonaNacionalidad, PersonaActivo, PersonaContra, c.CondominioNombre
		FROM            dbo.PersonaTable left join CondominioTable c
						on PersonaTable.PersonaCondominioId = c.CondominioId
		WHERE        (PersonaActivo = 1) AND (PersonaTipoId = 1) AND (c.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		SELECT        PersonaId, PersonaNombre, PersonaApellido, PersonaDocumento, PersonaTelefono, PersonaCorreo, PersonaSexoId, PersonaDireccion, PersonaRNC, PersonaTipoId, PersonaRolId, PersonaServicio, 
                         PersonaCompañia, PersonaNacionalidad, PersonaActivo, PersonaContra, c.CondominioNombre
		FROM            dbo.PersonaTable left join CondominioTable c
						on PersonaTable.PersonaCondominioId = c.CondominioId
		WHERE        (PersonaActivo = 1) AND (PersonaTipoId = 1) AND (c.CondominioId = @CondominioId)
	end