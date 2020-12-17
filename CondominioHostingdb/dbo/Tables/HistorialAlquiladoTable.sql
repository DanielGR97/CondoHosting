CREATE TABLE [dbo].[HistorialAlquiladoTable] (
    [HistorialAlquiladoId]               INT  IDENTITY (1, 1) NOT NULL,
    [HistorialAlquiladoInquilinoId]      INT  NOT NULL,
    [HistorialAlquiladoPropiedadId]      INT  NOT NULL,
    [HistorialAlquiladoFechaAlquiler]    DATE NOT NULL,
    [HistorialAlquiladoFechaTerminacion] DATE NOT NULL,
    [HistorialAlquiladoAbogadoId]        INT  NULL,
    CONSTRAINT [PK_HistorialAlquiladoTable] PRIMARY KEY CLUSTERED ([HistorialAlquiladoId] ASC),
    CONSTRAINT [FK_HistorialAlquiladoTable_PersonaTable] FOREIGN KEY ([HistorialAlquiladoInquilinoId]) REFERENCES [dbo].[PersonaTable] ([PersonaId]),
    CONSTRAINT [FK_HistorialAlquiladoTable_PersonaTable1] FOREIGN KEY ([HistorialAlquiladoAbogadoId]) REFERENCES [dbo].[PersonaTable] ([PersonaId]),
    CONSTRAINT [FK_HistorialAlquiladoTable_PropiedadTable] FOREIGN KEY ([HistorialAlquiladoPropiedadId]) REFERENCES [dbo].[PropiedadTable] ([PropiedadId])
);



