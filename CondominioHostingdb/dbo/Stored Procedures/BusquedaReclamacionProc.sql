CREATE proc BusquedaReclamacionProc
@PersonaId int,
@PersonaTipoId int,
@CondominioId int
as
if(@PersonaTipoId = 4)
	begin
		select r.ReclamacionId, c.CondominioNombre, p.PropiedadCodigo, per.PersonaNombre, r.ReclamacionDescripcion, 
		r.ReclamacionNota, r.ReclamacionCosto, t.TipoReclamacionDescripcion, r.ReclamacionEmpleadoId, r.ReclamacionTipoId
		from ReclamacionTable r left join CondominioTable c on r.ReclamacionCondominioId = c.CondominioId
			 left join PropiedadTable p on r.ReclamacionPropiedadId = p.PropiedadId
			 left join PersonaTable per on r.ReclamacionPersonaId = per.PersonaId
			 left join TipoReclamacionTable t on r.ReclamacionTipoId = t.TipoReclamacionId
		where (r.ReclamacionActivo = 1) and (c.CondominioPropietarioId = @PersonaId)
	end
else
	begin
		select r.ReclamacionId, c.CondominioNombre, p.PropiedadCodigo, per.PersonaNombre, r.ReclamacionDescripcion, 
		r.ReclamacionNota, r.ReclamacionCosto, t.TipoReclamacionDescripcion, r.ReclamacionEmpleadoId, r.ReclamacionTipoId
		from ReclamacionTable r left join CondominioTable c on r.ReclamacionCondominioId = c.CondominioId
			 left join PropiedadTable p on r.ReclamacionPropiedadId = p.PropiedadId
			 left join PersonaTable per on r.ReclamacionPersonaId = per.PersonaId
			 left join TipoReclamacionTable t on r.ReclamacionTipoId = t.TipoReclamacionId
		where (r.ReclamacionActivo = 1) AND (c.CondominioId = @CondominioId)
	end