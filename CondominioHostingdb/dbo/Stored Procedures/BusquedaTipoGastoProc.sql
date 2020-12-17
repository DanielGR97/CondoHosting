CREATE proc BusquedaTipoGastoProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		select t.TipoGastoId, t.TipoGastoDescripcion, t.TipoGastoActivo, case when t.TipoGastoFijo=0 then 'No' else 'Si' end TipoGastoFijoB, t.TipoGastoFijo, t.CondominioId, c.CondominioNombre
		from TipoGastoTable t left join CondominioTable c on t.CondominioId = c.CondominioId
		where (t.TipoGastoActivo = 1) AND (c.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		select t.TipoGastoId, t.TipoGastoDescripcion, t.TipoGastoActivo, case when t.TipoGastoFijo=0 then 'No' else 'Si' end TipoGastoFijoB, t.TipoGastoFijo, t.CondominioId, c.CondominioNombre
		from TipoGastoTable t left join CondominioTable c on t.CondominioId = c.CondominioId
		where (t.TipoGastoActivo = 1) AND (c.CondominioId = @CondominioId)
	end