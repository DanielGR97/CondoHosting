CREATE TABLE [dbo].[SexoTable] (
    [SexoId]          TINYINT        IDENTITY (1, 1) NOT NULL,
    [SexoDescripcion] VARCHAR(50) NOT NULL,
    CONSTRAINT [PK_SexoTable] PRIMARY KEY CLUSTERED ([SexoId] ASC)
);

