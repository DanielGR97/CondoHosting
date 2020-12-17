CREATE view MensualidadesView
as

select 
b.HistorialAlquiladoId,
a.Numero,
dateadd(month, numero, HistorialAlquiladoFechaAlquiler) FechaPago, 
b.Precio,
isnull(c.TotalPagado,0) Pagado,
b.Precio-isnull(c.TotalPagado,0) Pendiente
from Numeros a
inner join
(
	select 
		DATEDIFF(month,
		HistorialAlquiladoFechaAlquiler, HistorialAlquiladoFechaTerminacion) CantidadMeses,
		b.PropiedadPrecio Precio
		,*
	from [dbo].[HistorialAlquiladoTable] a
	inner join [dbo].[PropiedadTable] b on a.HistorialAlquiladoPropiedadId = b.PropiedadId
) b on a.Numero <= CantidadMeses
left join
(
	select HistorialAlquiladoId, Num, sum (IngresoCantidad) TotalPagado
	from [dbo].[IngresoTable]
	where IngresoActivo =1
	group by HistorialAlquiladoId, Num
) c on c.HistorialAlquiladoId=b.HistorialAlquiladoId and c.Num =a.Numero