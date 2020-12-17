create proc ComboBoxTipoIngresoProc
@CondominioId int
as
select t.TipoIngresoId, t.TipoIngresoDescripcion, t.TipoIngresoActivo, t.CondominioId, c.CondominioNombre
from TipoIngresoTable t left join CondominioTable c on t.CondominioId = c.CondominioId
where (t.TipoIngresoActivo = 1) AND (c.CondominioId = @CondominioId)