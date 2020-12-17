
CREATE proc BusquedaCondominioProc
@PersonaId int
as
select c.CondominioId, c.CondominioNombre, c.CondominioTelefono, c.CondominioDescripcion, c.CondominioDireccion, c.CondominioMembresiaId, c.CondominioSectorId, c.CondominioPropietarioId, s.SectorDescripcion
from CondominioTable c left join SectorTable s on s.SectorId = c.CondominioSectorId
where c.CondominioPropietarioId = @PersonaId