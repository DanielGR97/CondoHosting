CREATE procedure [dbo].[BuscarGastos]
@fechaIn date,
@fechaLim date,
@condominio int
as
select p.CondominioNombre, g.GastoDescripcion, tg.TipoGastoDescripcion, g.GastoFecha, g.GastoCantidad
from GastoTable g
left join CondominioTable p on g.CondominioId = p.CondominioId
left join TipoGastoTable tg on g.GastoTipoGastoId = tg.TipoGastoId
left join PropiedadTable prop on g.GastoPropiedadId = prop.PropiedadId
where g.CondominioId = @condominio and GastoFecha between @fechaIn and @fechaLim