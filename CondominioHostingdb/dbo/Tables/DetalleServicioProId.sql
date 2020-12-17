CREATE TABLE [dbo].[DetalleServicioProId] (
    [DetalleServicioId] INT IDENTITY (1, 1) NOT NULL,
    [ServicioId]        INT NOT NULL,
    [PropiedadId]       INT NOT NULL,
    CONSTRAINT [PK_DetalleServicioProId] PRIMARY KEY CLUSTERED ([DetalleServicioId] ASC),
    CONSTRAINT [FK_DetalleServicioProId_ServicioPropiedadTable] FOREIGN KEY ([PropiedadId]) REFERENCES [dbo].[PropiedadTable] ([PropiedadId]),
    CONSTRAINT [FK_DetalleServicioProId_ServicioTable] FOREIGN KEY ([ServicioId]) REFERENCES [dbo].[ServicioTable] ([ServicioId])
);







