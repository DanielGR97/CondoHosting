CREATE proc BusquedaInquilinoProProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		SELECT        PersonaId, PersonaNombre, PersonaApellido, PersonaDocumento, PersonaTelefono, PersonaCorreo, PersonaSexoId, PersonaDireccion, PersonaRNC, PersonaTipoId, PersonaRolId, PersonaServicio, 
                         PersonaCompañia, PersonaNacionalidad, PersonaActivo, PersonaContra, PersonaTable.PersonaCondominioId
		FROM            dbo.PersonaTable inner join CondominioTable c ON c.CondominioId = PersonaTable.PersonaCondominioId
		WHERE        (PersonaActivo = 1) AND (PersonaTipoId = 1) and (c.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		SELECT        PersonaId, PersonaNombre, PersonaApellido, PersonaDocumento, PersonaTelefono, PersonaCorreo, PersonaSexoId, PersonaDireccion, PersonaRNC, PersonaTipoId, PersonaRolId, PersonaServicio, 
                         PersonaCompañia, PersonaNacionalidad, PersonaActivo, PersonaContra, PersonaTable.PersonaCondominioId
		FROM            dbo.PersonaTable inner join CondominioTable c ON c.CondominioId = PersonaTable.PersonaCondominioId
		WHERE        (PersonaActivo = 1) AND (PersonaTipoId = 1)  AND (c.CondominioId = @CondominioId)
	end