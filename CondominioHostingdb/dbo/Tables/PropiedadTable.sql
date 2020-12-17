CREATE TABLE [dbo].[PropiedadTable] (
    [PropiedadId]           INT             IDENTITY (1, 1) NOT NULL,
    [PropiedadCodigo]       VARCHAR (10)    NOT NULL,
    [PropiedadHabitaciones] TINYINT         NOT NULL,
    [PropiedadCondominioId] INT             NOT NULL,
    [PropiedadDescripcion]  VARCHAR (MAX)   NOT NULL,
    [PropiedadPrecio]       DECIMAL (18, 2) NOT NULL,
    [PropiedadInquilinoId]  INT             NULL,
    [PropiedadActivo]       BIT             NOT NULL,
    [PropiedadBanos]        TINYINT         NULL,
    [PropiedadTerraza]      BIT             NULL,
    CONSTRAINT [PK_PropiedadTable] PRIMARY KEY CLUSTERED ([PropiedadId] ASC),
    CONSTRAINT [FK_PropiedadTable_CondominioTable] FOREIGN KEY ([PropiedadCondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId]),
    CONSTRAINT [FK_PropiedadTable_InquilinoTable] FOREIGN KEY ([PropiedadInquilinoId]) REFERENCES [dbo].[PersonaTable] ([PersonaId])
);



