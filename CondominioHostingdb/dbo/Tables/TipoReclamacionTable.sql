CREATE TABLE [dbo].[TipoReclamacionTable] (
    [TipoReclamacionId]          INT          IDENTITY (1, 1) NOT NULL,
    [TipoReclamacionDescripcion] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_TipoReclamacionTable] PRIMARY KEY CLUSTERED ([TipoReclamacionId] ASC)
);

