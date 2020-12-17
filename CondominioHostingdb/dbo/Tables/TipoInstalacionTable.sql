CREATE TABLE [dbo].[TipoInstalacionTable] (
    [TipoInstalacionId]          INT            IDENTITY (1, 1) NOT NULL,
    [TipoInstalacionDescripcion] NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_TipoInstalacionTable] PRIMARY KEY CLUSTERED ([TipoInstalacionId] ASC)
);





