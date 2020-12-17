CREATE procedure [dbo].[BuscarTipoIngresos]
@condominio int,
@fechaIni date,
@fechaFin date
as

select  ct.CondominioNombre, ti.TipoIngresoDescripcion, SUM(it.IngresoCantidad) TotalIngresos, case when ti.TipoIngresoActivo = 0 then 'No' else 'Si' end TipoIngresoActivo  
from  IngresoTable it inner join  TipoIngresoTable ti on it.IngresoTipoIngresoId = ti.TipoIngresoId
left join CondominioTable ct on ti.CondominioId = ct.CondominioId
where it.IngresoFecha between @fechaIni and @fechaFin and ti.CondominioId = @condominio
group by ti.TipoIngresoDescripcion, it.IngresoTipoIngresoId, ti.TipoIngresoActivo, ct.CondominioNombre