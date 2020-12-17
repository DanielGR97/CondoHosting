create proc BusquedaTipoIngresoProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		select t.TipoIngresoId, t.TipoIngresoDescripcion, t.TipoIngresoActivo, t.CondominioId, c.CondominioNombre
		from TipoIngresoTable t left join CondominioTable c on t.CondominioId = c.CondominioId
		where (t.TipoIngresoActivo = 1) AND (c.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		select t.TipoIngresoId, t.TipoIngresoDescripcion, t.TipoIngresoActivo, t.CondominioId, c.CondominioNombre
		from TipoIngresoTable t left join CondominioTable c on t.CondominioId = c.CondominioId
		where (t.TipoIngresoActivo = 1) AND (c.CondominioId = @CondominioId)
	end