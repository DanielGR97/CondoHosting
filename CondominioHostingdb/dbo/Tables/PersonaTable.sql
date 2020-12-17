CREATE TABLE [dbo].[PersonaTable] (
    [PersonaId]              INT           IDENTITY (1, 1) NOT NULL,
    [PersonaNombre]          VARCHAR (50)  NOT NULL,
    [PersonaApellido]        VARCHAR (50)  NOT NULL,
    [PersonaDocumento]       VARCHAR (15)  NOT NULL,
    [PersonaTelefono]        VARCHAR (15)  NOT NULL,
    [PersonaCorreo]          VARCHAR (50)  NULL,
    [PersonaSexoId]          TINYINT       NOT NULL,
    [PersonaFechaNacimiento] DATE          NULL,
    [PersonaDireccion]       VARCHAR (MAX) NOT NULL,
    [PersonaRNC]             VARCHAR (11)  NULL,
    [PersonaTipoId]          INT           NOT NULL,
    [PersonaRolId]           INT           NULL,
    [PersonaServicio]        INT           NULL,
    [PersonaCompañia]        VARCHAR (50)  NULL,
    [PersonaNacionalidad]    INT           NULL,
    [PersonaActivo]          BIT           NULL,
    [PersonaContra]          VARCHAR (50)  NULL,
    [PersonaSueldo]          MONEY         NULL,
    [PersonaFechaEntrada]    DATE          NULL,
    [PersonaCondominioId]    INT           NULL,
    [PersonaCivilId]         INT           NULL,
    [PersonaReferidoId]      INT           NULL,
    CONSTRAINT [PK_InquilinoTable] PRIMARY KEY CLUSTERED ([PersonaId] ASC),
    CONSTRAINT [FK_InquilinoTable_SexoTable] FOREIGN KEY ([PersonaSexoId]) REFERENCES [dbo].[SexoTable] ([SexoId]),
    CONSTRAINT [FK_PersonaTable_DetalleRolTable] FOREIGN KEY ([PersonaRolId]) REFERENCES [dbo].[RolTable] ([RolId]),
    CONSTRAINT [FK_PersonaTable_EstadoCivilTable] FOREIGN KEY ([PersonaCivilId]) REFERENCES [dbo].[EstadoCivilTable] ([IdEstadoCivil]),
    CONSTRAINT [FK_PersonaTable_NacionalidadTable] FOREIGN KEY ([PersonaNacionalidad]) REFERENCES [dbo].[NacionalidadTable] ([NacionalidadId]),
    CONSTRAINT [FK_PersonaTable_PersonaTable] FOREIGN KEY ([PersonaReferidoId]) REFERENCES [dbo].[PersonaTable] ([PersonaId]),
    CONSTRAINT [FK_PersonaTable_ServicioContratistaTable] FOREIGN KEY ([PersonaServicio]) REFERENCES [dbo].[ServicioContratistaTable] ([ServicioContratistaId]),
    CONSTRAINT [FK_PersonaTable_TipoPersonaTable] FOREIGN KEY ([PersonaTipoId]) REFERENCES [dbo].[TipoPersonaTable] ([TipoPersonaId])
);















