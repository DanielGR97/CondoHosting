CREATE TABLE [dbo].[ServicioTable] (
    [ServicioId]          INT             IDENTITY (1, 1) NOT NULL,
    [ServicioDescripcion] NVARCHAR (MAX)  NOT NULL,
    [ServicioGasto]       DECIMAL (18, 2) NOT NULL,
    [CondominioId]        INT             NOT NULL,
    CONSTRAINT [PK_ServicioTable] PRIMARY KEY CLUSTERED ([ServicioId] ASC),
    CONSTRAINT [FK_ServicioTable_CondominioTable] FOREIGN KEY ([CondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId])
);









