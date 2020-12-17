
CREATE procedure [dbo].[EmpleadosActivos]
@laborando bit,
@condominio int
as 
select PersonaNombre, PersonaDocumento, PersonaDireccion, PersonaTelefono, case when PersonaActivo= 1 then 'Laborando' else 'Sin laborar' end EstadoEmpleado 
from PersonaTable where PersonaTipoId = 3 and PersonaActivo = @laborando and PersonaCondominioId = @condominio