CREATE TABLE [dbo].[TipoIngresoTable] (
    [TipoIngresoId]          INT          IDENTITY (1, 1) NOT NULL,
    [TipoIngresoDescripcion] VARCHAR (50) NOT NULL,
    [TipoIngresoActivo]      BIT          NOT NULL,
    [CondominioId]           INT          NULL,
    CONSTRAINT [PK_TipoIngresoTable] PRIMARY KEY CLUSTERED ([TipoIngresoId] ASC),
    CONSTRAINT [FK_TipoIngresoTable_CondominioTable] FOREIGN KEY ([CondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId])
);



