CREATE TABLE [dbo].[GastoTable] (
    [GastoId]            INT             IDENTITY (1, 1) NOT NULL,
    [GastoDescripcion]   VARCHAR (50)    NOT NULL,
    [GastoTipoGastoId]   INT             NOT NULL,
    [GastoFecha]         DATE            NOT NULL,
    [GastoCantidad]      DECIMAL (18, 2) NOT NULL,
    [GastoActivo]        BIT             NOT NULL,
    [GastoPropiedadId]   INT             NULL,
    [GastoInstalacionId] INT             NULL,
    [GastoServicioId]    INT             NULL,
    [CondominioId]       INT             NULL,
    CONSTRAINT [PK_GastoTable] PRIMARY KEY CLUSTERED ([GastoId] ASC),
    CONSTRAINT [FK_GastoTable_CondominioTable] FOREIGN KEY ([CondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId]),
    CONSTRAINT [FK_GastoTable_GastoTable] FOREIGN KEY ([GastoTipoGastoId]) REFERENCES [dbo].[TipoGastoTable] ([TipoGastoId]),
    CONSTRAINT [FK_GastoTable_InstalacionTable] FOREIGN KEY ([GastoInstalacionId]) REFERENCES [dbo].[InstalacionTable] ([InstalacionId]),
    CONSTRAINT [FK_GastoTable_PropiedadTable] FOREIGN KEY ([GastoPropiedadId]) REFERENCES [dbo].[PropiedadTable] ([PropiedadId]),
    CONSTRAINT [FK_GastoTable_ServicioTable] FOREIGN KEY ([GastoServicioId]) REFERENCES [dbo].[ServicioTable] ([ServicioId])
);



