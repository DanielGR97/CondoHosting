CREATE TABLE [dbo].[MantenimientoTable] (
    [MantenimientoId]     INT          IDENTITY (1, 1) NOT NULL,
    [MantenPersonaId]     INT          NOT NULL,
    [MantenimientoFecha]  DATE         NOT NULL,
    [Descripcion]         VARCHAR (50) NOT NULL,
    [MantenimientoActivo] BIT          NOT NULL,
    [CondominioId]        INT          NULL,
    [MantenInstalacionId] INT          NULL,
    [MantenPropiedadId]   INT          NULL,
    CONSTRAINT [PK_MantenimientoTable] PRIMARY KEY CLUSTERED ([MantenimientoId] ASC),
    CONSTRAINT [FK_MantenimientoTable_CondominioTable] FOREIGN KEY ([CondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId]),
    CONSTRAINT [FK_MantenimientoTable_PersonaTable] FOREIGN KEY ([MantenPersonaId]) REFERENCES [dbo].[PersonaTable] ([PersonaId]),
    CONSTRAINT [FK_MantenimientoTable_PropiedadTable] FOREIGN KEY ([MantenPropiedadId]) REFERENCES [dbo].[PropiedadTable] ([PropiedadId]),
    CONSTRAINT [FK_MantenimientoTable_TipoInstalacionTable] FOREIGN KEY ([MantenInstalacionId]) REFERENCES [dbo].[InstalacionTable] ([InstalacionId])
);



