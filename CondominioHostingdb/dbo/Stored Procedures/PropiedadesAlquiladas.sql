CREATE procedure [dbo].[PropiedadesAlquiladas]
@alquilada bit,
@condominio int
as
select pt.PropiedadCodigo, ct.CondominioNombre,Pert.PersonaNombre, case when pt.PropiedadActivo = 1 then 'Alquilada' else 'Vacia' end EstadoPropiedad from PropiedadTable pt
inner join PersonaTable Pert on pt.PropiedadInquilinoId = Pert.PersonaId 
inner join  CondominioTable ct on pt.PropiedadCondominioId = ct.CondominioId
where  pt.PropiedadActivo = @alquilada and Pert.PersonaTipoId = 1 and pt.PropiedadCondominioId = @condominio