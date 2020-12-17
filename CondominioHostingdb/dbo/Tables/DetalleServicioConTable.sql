CREATE TABLE [dbo].[DetalleServicioConTable] (
    [DetalleServicioConId]  INT IDENTITY (1, 1) NOT NULL,
    [ServicioContratistaId] INT NOT NULL,
    [SerConNombreId]        INT NOT NULL,
    CONSTRAINT [PK_DetalleServicioConTable] PRIMARY KEY CLUSTERED ([DetalleServicioConId] ASC),
    CONSTRAINT [FK_DetalleServicioConTable_SerConNombreTable] FOREIGN KEY ([SerConNombreId]) REFERENCES [dbo].[SerConNombreTable] ([SerConNombreId]),
    CONSTRAINT [FK_DetalleServicioConTable_ServicioContratistaTable] FOREIGN KEY ([ServicioContratistaId]) REFERENCES [dbo].[ServicioContratistaTable] ([ServicioContratistaId])
);



