CREATE proc BusquedaPresupuestoProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
    begin
        select p.PresupuestoId, p.PresupuestoFecha, c.CondominioNombre
        from PresupuestoTable p left join CondominioTable c on p.PresupuestoCondominioId = c.CondominioId
        where (c.CondominioPropietarioId = @PersonaId)
    end
else
    begin
        select p.PresupuestoId, p.PresupuestoFecha, c.CondominioNombre
        from PresupuestoTable p left join CondominioTable c on p.PresupuestoCondominioId= c.CondominioId
        where (c.CondominioId = @CondominioId)
    end