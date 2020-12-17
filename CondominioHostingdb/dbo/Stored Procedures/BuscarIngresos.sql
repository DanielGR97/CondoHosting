CREATE proc [dbo].[BuscarIngresos]
@fechaini date,
@fechaFin date,
@condominio int
as
select p.CondominioNombre, It.IngresoDescripcion, pt.PersonaNombre, ti.TipoIngresoDescripcion,It.IngresoCantidad, It.IngresoFecha, case when It.IngresoActivo=1 then 'Activo' else 'Inactivo' end EstadoIngreso, It.IngresoCantidad
from IngresoTable It
left join CondominioTable p on It.CondominioId = p.CondominioId
left join TipoIngresoTable ti on It.IngresoTipoIngresoId = ti.TipoIngresoId
left join PersonaTable pt on It.IngresoInquilinoId = pt.PersonaId
where It.CondominioId = @condominio and IngresoFecha between @fechaini and @fechaFin