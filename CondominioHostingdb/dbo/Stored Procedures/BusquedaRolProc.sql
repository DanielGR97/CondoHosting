CREATE proc BusquedaRolProc
@PersonaId int
as
select r.RolId, r.Descripcion, c.CondominioNombre
from RolTable r inner join CondominioTable c on c.CondominioId = r.CondominioId
where c.CondominioPropietarioId = @PersonaId