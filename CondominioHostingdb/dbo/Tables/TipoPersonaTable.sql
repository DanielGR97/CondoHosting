CREATE TABLE [dbo].[TipoPersonaTable] (
    [TipoPersonaId]          INT          IDENTITY (1, 1) NOT NULL,
    [TipoPersonaDescripcion] VARCHAR (50) NOT NULL,
    [CondominioId]           INT          NULL,
    CONSTRAINT [PK_TipoPersonaTable] PRIMARY KEY CLUSTERED ([TipoPersonaId] ASC),
    CONSTRAINT [FK_TipoPersonaTable_CondominioTable] FOREIGN KEY ([CondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId])
);



