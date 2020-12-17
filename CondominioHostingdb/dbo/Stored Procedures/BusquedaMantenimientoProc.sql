CREATE proc [dbo].[BusquedaMantenimientoProc]
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		select m.MantenimientoId, m.Descripcion, m.MantenimientoFecha, 
	   case when m.MantenimientoActivo = 0 then 'No' else 'Si' end MantenimientoActivo,
	   c.CondominioNombre, p.PersonaNombre, p.PersonaApellido, prop.PropiedadCodigo, i.InstalacionDescripcion
		from MantenimientoTable m 
			left join CondominioTable c on c.CondominioId = m.CondominioId
			left join PersonaTable p on p.PersonaId = m.MantenPersonaId
			left join PropiedadTable prop on prop.PropiedadId = m.MantenPropiedadId
			left join InstalacionTable i on i.InstalacionId = m.MantenInstalacionId
		where (m.MantenimientoActivo = 1) and (c.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		select m.MantenimientoId, m.Descripcion, m.MantenimientoFecha, 
	   case when m.MantenimientoActivo = 0 then 'No' else 'Si' end MantenimientoActivo,
	   c.CondominioNombre, p.PersonaNombre, p.PersonaApellido, prop.PropiedadCodigo, i.InstalacionDescripcion
		from MantenimientoTable m 
			left join CondominioTable c on c.CondominioId = m.CondominioId
			left join PersonaTable p on p.PersonaId = m.MantenPersonaId
			left join PropiedadTable prop on prop.PropiedadId = m.MantenPropiedadId
			left join InstalacionTable i on i.InstalacionId = m.MantenInstalacionId
		where (m.MantenimientoActivo = 1) AND (c.CondominioId = @CondominioId)
	end