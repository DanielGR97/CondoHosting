CREATE proc BusquedaEventoProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		select e.EventoFechaInicial, e.EventoFechaFinal, e.EventoDescripcion
		from EventoTable e  left join CondominioTable c on e.CondominioId = c.CondominioId
		where (e.EventoActivo = 1) AND (c.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		select e.EventoFechaInicial, e.EventoFechaFinal, e.EventoDescripcion
		from EventoTable e  left join CondominioTable c on e.CondominioId = c.CondominioId
		where (e.EventoActivo = 1) AND (c.CondominioId = @CondominioId)
	end