CREATE TABLE [dbo].[HistorialTable] (
    [HistorialId]            INT             IDENTITY (1, 1) NOT NULL,
    [HistorialDescripcion]   VARCHAR (MAX)   NOT NULL,
    [HistorialFecha]         DATE            NOT NULL,
    [HistorialCosto]         DECIMAL (18, 2) NOT NULL,
    [HistorialContratistaId] INT             NULL,
    [HistorialEmpleadoId]    INT             NULL,
    [HistorialReclamacionId] INT             NULL,
    [CondominioId]           INT             NULL,
    CONSTRAINT [PK_HistorialTable] PRIMARY KEY CLUSTERED ([HistorialId] ASC),
    CONSTRAINT [FK_HistorialTable_CondominioTable] FOREIGN KEY ([CondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId]),
    CONSTRAINT [FK_HistorialTable_PersonaTable] FOREIGN KEY ([HistorialContratistaId]) REFERENCES [dbo].[PersonaTable] ([PersonaId]),
    CONSTRAINT [FK_HistorialTable_PersonaTable1] FOREIGN KEY ([HistorialEmpleadoId]) REFERENCES [dbo].[PersonaTable] ([PersonaId]),
    CONSTRAINT [FK_HistorialTable_ReclamacionTable] FOREIGN KEY ([HistorialReclamacionId]) REFERENCES [dbo].[ReclamacionTable] ([ReclamacionId])
);



