CREATE proc InquilinosCondominio
@viviendo bit
as
select pt.PersonaNombre + '' + pt.PersonaApellido NombreInquilino, pt.PersonaFechaEntrada, Prot.PropiedadCodigo, ct.CondominioNombre, case when pt.PersonaActivo= 1 then 'En el condominio' else 'Fuera del condominio' end InquilinosCondominio from PersonaTable pt
left join PropiedadTable Prot on pt.PersonaId = Prot.PropiedadInquilinoId
left join CondominioTable ct on Prot.PropiedadCondominioId = ct.CondominioId
where pt.PersonaActivo = @viviendo