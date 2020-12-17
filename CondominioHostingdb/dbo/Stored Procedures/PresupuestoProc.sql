CREATE proc PresupuestoProc
@condominio int,
@fechaIni date,
@fechaFin date
as 
select c.CondominioNombre, 
	   tg.TipoGastoDescripcion, 
	   dp.DetallePresupuestoCosto,  
	   (select sum(gt.GastoCantidad)
		from TipoGastoTable tg left join GastoTable gt on tg.TipoGastoId = gt.GastoTipoGastoId
		where tg.TipoGastoId = dp.DetallePresupuestoTipoGastoId 
		and gt.CondominioId = @condominio
		and gt.GastoFecha between @fechaIni and @fechaFin) as GastosReales,
		p.PresupuestoFecha
													
from DetallePresupuestoTable dp
	 left join PresupuestoTable p on p.PresupuestoId = dp.PresupuestoId
		left join CondominioTable c on c.CondominioId = p.PresupuestoCondominioId
	 left join TipoGastoTable tg on tg.TipoGastoId = dp.DetallePresupuestoTipoGastoId

where p.PresupuestoActivo = 1 
	and p.PresupuestoCondominioId = @condominio
	and p.PresupuestoFecha between @fechaIni and @fechaFin