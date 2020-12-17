CREATE TABLE [dbo].[DetalleRolTable] (
    [DetalleRolId] INT IDENTITY (1, 1) NOT NULL,
    [RolId]        INT NOT NULL,
    [AccesoId]     INT NOT NULL,
    CONSTRAINT [PK_DetalleRolTable] PRIMARY KEY CLUSTERED ([DetalleRolId] ASC),
    CONSTRAINT [FK_DetalleRolTable_AccesoTable] FOREIGN KEY ([AccesoId]) REFERENCES [dbo].[AccesoTable] ([AccesoId]),
    CONSTRAINT [FK_DetalleRolTable_RolTable] FOREIGN KEY ([RolId]) REFERENCES [dbo].[RolTable] ([RolId])
);







