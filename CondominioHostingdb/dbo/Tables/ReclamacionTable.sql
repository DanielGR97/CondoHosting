CREATE TABLE [dbo].[ReclamacionTable] (
    [ReclamacionId]               INT             IDENTITY (1, 1) NOT NULL,
    [ReclamacionPersonaId]        INT             NOT NULL,
    [ReclamacionSolucionado]      BIT             NOT NULL,
    [ReclamacionPropiedadId]      INT             NOT NULL,
    [ReclamacionDescripcion]      VARCHAR (MAX)   NOT NULL,
    [ReclamacionEmpleadoId]       INT             NULL,
    [ReclamacionNota]             VARCHAR (MAX)   NULL,
    [ReclamacionCosto]            DECIMAL (18, 2) NULL,
    [ReclamacionActivo]           BIT             NOT NULL,
    [ReclamacionFechaCreacion]    DATE            NULL,
    [ReclamacionFechaSolucionada] DATE            NULL,
    [ReclamacionTipoId]           INT             NULL,
    [ReclamacionCondominioId]     INT             NULL,
    CONSTRAINT [PK_ReclamacionTable] PRIMARY KEY CLUSTERED ([ReclamacionId] ASC),
    CONSTRAINT [FK_ReclamacionTable_CondominioTable] FOREIGN KEY ([ReclamacionCondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId]),
    CONSTRAINT [FK_ReclamacionTable_InquilinoTable] FOREIGN KEY ([ReclamacionPersonaId]) REFERENCES [dbo].[PersonaTable] ([PersonaId]),
    CONSTRAINT [FK_ReclamacionTable_InquilinoTable1] FOREIGN KEY ([ReclamacionEmpleadoId]) REFERENCES [dbo].[PersonaTable] ([PersonaId]),
    CONSTRAINT [FK_ReclamacionTable_PropiedadTable] FOREIGN KEY ([ReclamacionPropiedadId]) REFERENCES [dbo].[PropiedadTable] ([PropiedadId]),
    CONSTRAINT [FK_ReclamacionTable_TipoReclamacionTable] FOREIGN KEY ([ReclamacionTipoId]) REFERENCES [dbo].[TipoReclamacionTable] ([TipoReclamacionId])
);





