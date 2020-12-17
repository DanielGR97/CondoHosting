CREATE TABLE [dbo].[EventoTable] (
    [EventoId]            INT           IDENTITY (1, 1) NOT NULL,
    [EventoDescripcion]   VARCHAR (MAX) NOT NULL,
    [EventoInquilinoId]   INT           NOT NULL,
    [EventoInstalacionId] INT           NOT NULL,
    [EventoFechaInicial]  DATETIME      NOT NULL,
    [EventoFechaFinal]    DATETIME      NOT NULL,
    [EventoActivo]        BIT           NOT NULL,
    [CondominioId]        INT           NULL,
    CONSTRAINT [PK_EventoTable] PRIMARY KEY CLUSTERED ([EventoId] ASC),
    CONSTRAINT [FK_EventoTable_CondominioTable] FOREIGN KEY ([CondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId]),
    CONSTRAINT [FK_EventoTable_InstalacionTable] FOREIGN KEY ([EventoInstalacionId]) REFERENCES [dbo].[InstalacionTable] ([InstalacionId]),
    CONSTRAINT [FK_EventoTable_PersonaTable] FOREIGN KEY ([EventoInquilinoId]) REFERENCES [dbo].[PersonaTable] ([PersonaId])
);



