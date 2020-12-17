CREATE TABLE [dbo].[NacionalidadTable] (
    [NacionalidadId]     INT          IDENTITY (1, 1) NOT NULL,
    [NacionalidadNombre] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_NacionalidadTable] PRIMARY KEY CLUSTERED ([NacionalidadId] ASC)
);

