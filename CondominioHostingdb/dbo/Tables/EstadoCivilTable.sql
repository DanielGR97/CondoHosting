CREATE TABLE [dbo].[EstadoCivilTable] (
    [IdEstadoCivil]          INT          IDENTITY (1, 1) NOT NULL,
    [EstadoCivilDescripcion] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_EstadoCivilTable] PRIMARY KEY CLUSTERED ([IdEstadoCivil] ASC)
);

