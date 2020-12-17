CREATE TABLE [dbo].[RolTable] (
    [RolId]        INT           IDENTITY (1, 1) NOT NULL,
    [Descripcion]  NVARCHAR (50) NOT NULL,
    [CondominioId] INT           NULL,
    CONSTRAINT [PK_RolTable] PRIMARY KEY CLUSTERED ([RolId] ASC),
    CONSTRAINT [FK_RolTable_CondominioTable] FOREIGN KEY ([CondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId])
);



