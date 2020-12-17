CREATE TABLE [dbo].[SerConNombreTable] (
    [SerConNombreId]          INT          IDENTITY (1, 1) NOT NULL,
    [SerConNombreDescripcion] VARCHAR (50) NOT NULL,
    [CondominioId]            INT          NULL,
    CONSTRAINT [PK_SerConNombreTable] PRIMARY KEY CLUSTERED ([SerConNombreId] ASC),
    CONSTRAINT [FK_SerConNombreTable_CondominioTable] FOREIGN KEY ([CondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId])
);

