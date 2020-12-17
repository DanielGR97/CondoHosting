CREATE TABLE [dbo].[TipoGastoTable] (
    [TipoGastoId]          INT          IDENTITY (1, 1) NOT NULL,
    [TipoGastoDescripcion] VARCHAR (50) NOT NULL,
    [TipoGastoActivo]      BIT          NOT NULL,
    [TipoGastoFijo]        BIT          NOT NULL,
    [CondominioId]         INT          NULL,
    CONSTRAINT [PK_TipoGastoTable] PRIMARY KEY CLUSTERED ([TipoGastoId] ASC),
    CONSTRAINT [FK_TipoGastoTable_CondominioTable] FOREIGN KEY ([CondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId])
);



