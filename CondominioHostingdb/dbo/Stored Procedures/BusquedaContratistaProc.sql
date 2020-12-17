create proc BusquedaContratistaProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		SELECT        PersonaId, PersonaNombre, PersonaApellido, PersonaDocumento, PersonaTelefono, PersonaCorreo, PersonaSexoId, PersonaDireccion, PersonaRNC, PersonaTipoId, PersonaRolId, PersonaServicio, 
                         PersonaCompañia, PersonaNacionalidad, PersonaActivo, PersonaContra, c.CondominioNombre, s.ServicioContratistaNombre
		FROM            dbo.PersonaTable left join CondominioTable c on c.CondominioId = PersonaTable.PersonaCondominioId
						left join ServicioContratistaTable s on s.ServicioContratistaId = PersonaTable.PersonaServicio
		WHERE        (PersonaTipoId = 5) AND (PersonaActivo = 1) AND (c.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		SELECT        PersonaId, PersonaNombre, PersonaApellido, PersonaDocumento, PersonaTelefono, PersonaCorreo, PersonaSexoId, PersonaDireccion, PersonaRNC, PersonaTipoId, PersonaRolId, PersonaServicio, 
                         PersonaCompañia, PersonaNacionalidad, PersonaActivo, PersonaContra, c.CondominioNombre, s.ServicioContratistaNombre
		FROM            dbo.PersonaTable left join CondominioTable c on c.CondominioId = PersonaTable.PersonaCondominioId
						left join ServicioContratistaTable s on s.ServicioContratistaId = PersonaTable.PersonaServicio
		WHERE        (PersonaTipoId = 5) AND (PersonaActivo = 1)AND (c.CondominioId = @CondominioId)
	end