create proc ComboBoxTipoGastoProc
@CondominioId int
as
select t.TipoGastoId, t.TipoGastoDescripcion, t.TipoGastoActivo, t.CondominioId, c.CondominioNombre
		from TipoGastoTable t left join CondominioTable c on t.CondominioId = c.CondominioId
		where (t.TipoGastoActivo = 1) AND (c.CondominioId = @CondominioId)