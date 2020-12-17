CREATE proc BusquedaServicioProProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
    begin
        select s.ServicioId, s.ServicioDescripcion, c.CondominioNombre, s.ServicioGasto
        from ServicioTable s left join CondominioTable c on s.CondominioId = c.CondominioId
        where (c.CondominioPropietarioId = @PersonaId)
    end
else
    begin
        select s.ServicioId, s.ServicioDescripcion, c.CondominioNombre, s.ServicioGasto
        from ServicioTable s left join CondominioTable c on s.CondominioId = c.CondominioId
        where (c.CondominioId = @CondominioId)
    end