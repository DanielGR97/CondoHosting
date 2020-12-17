CREATE TABLE [dbo].[InstalacionTable] (
    [InstalacionId]             INT           IDENTITY (1, 1) NOT NULL,
    [InstalacionTipoId]         INT           NOT NULL,
    [InstalacionCondominioId]   INT           NOT NULL,
    [InstalacionDescripcion]    VARCHAR (MAX) NOT NULL,
    [InstalacionHorarioInicial] TIME (7)      NOT NULL,
    [InstalacionHorarioFinal]   TIME (7)      NOT NULL,
    [InstalacionOcupado]        BIT           NOT NULL,
    [InstalacionActivo]         BIT           NOT NULL,
    CONSTRAINT [PK_InstalacionTable] PRIMARY KEY CLUSTERED ([InstalacionId] ASC),
    CONSTRAINT [FK_InstalacionTable_CondominioTable] FOREIGN KEY ([InstalacionCondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId]),
    CONSTRAINT [FK_InstalacionTable_TipoInstalacionTable] FOREIGN KEY ([InstalacionTipoId]) REFERENCES [dbo].[TipoInstalacionTable] ([TipoInstalacionId])
);

