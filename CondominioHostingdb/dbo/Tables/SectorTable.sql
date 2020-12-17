CREATE TABLE [dbo].[SectorTable] (
    [SectorId]          INT          IDENTITY (1, 1) NOT NULL,
    [SectorDescripcion] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_SectorTable] PRIMARY KEY CLUSTERED ([SectorId] ASC)
);

