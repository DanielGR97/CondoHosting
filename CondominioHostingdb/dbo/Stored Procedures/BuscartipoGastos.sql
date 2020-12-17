CREATE procedure [dbo].[BuscartipoGastos]
@condominio int,
@fechaIni date,
@fechaFin date
as
 
select g.GastoTipoGastoId, t.TipoGastoDescripcion,  ct.CondominioNombre, case when t.TipoGastoFijo=1 then 'Si' else 'No' end GastoFijo, SUM(g.GastoCantidad) TotalGastos
from GastoTable g inner join TipoGastoTable t on g.GastoTipoGastoId = t.TipoGastoId
left join CondominioTable ct on g.CondominioId = ct.CondominioId
where g.CondominioId = @condominio and g.GastoFecha between @fechaIni and @fechaFin
group by t.TipoGastoDescripcion, g.GastoTipoGastoId, t.TipoGastoFijo, ct.CondominioNombre