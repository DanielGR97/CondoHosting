CREATE TABLE [dbo].[ServicioContratistaTable] (
    [ServicioContratistaId]     INT          IDENTITY (1, 1) NOT NULL,
    [ServicioContratistaNombre] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ServicioContratistaTable] PRIMARY KEY CLUSTERED ([ServicioContratistaId] ASC),
    CONSTRAINT [FK_ServicioContratistaTable_ServicioContratistaTable] FOREIGN KEY ([ServicioContratistaId]) REFERENCES [dbo].[ServicioContratistaTable] ([ServicioContratistaId])
);







