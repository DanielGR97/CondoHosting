CREATE proc BusquedaRolEmProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
			select r.RolId, r.Descripcion, c.CondominioNombre
			from RolTable r inner join CondominioTable c on c.CondominioId = r.CondominioId
			where c.CondominioPropietarioId = @PersonaId
	end
else
	begin
		select r.RolId, r.Descripcion, c.CondominioNombre
		from RolTable r inner join CondominioTable c on c.CondominioId = r.CondominioId
		where r.CondominioId = @CondominioId
	end