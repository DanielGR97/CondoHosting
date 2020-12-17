CREATE proc [dbo].[contratistasActivos]
@type bit,
@condominio int
as
select pt.PersonaNombre + '' + pt.PersonaApellido NombreCompleto , pt.PersonaCompañia, pt.PersonaRNC, st.ServicioContratistaNombre, case when pt.PersonaActivo= 1 then 'En servicio' else 'Fuera de servicio' end EstadoContratista
from PersonaTable pt  left join ServicioContratistaTable st on pt.PersonaServicio = st.ServicioContratistaId
where PersonaTipoId= 5 and pt.PersonaActivo = @type and pt.PersonaCondominioId = @condominio