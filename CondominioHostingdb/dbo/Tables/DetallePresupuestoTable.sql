CREATE TABLE [dbo].[DetallePresupuestoTable] (
    [DetallePresupuestoId]          INT             IDENTITY (1, 1) NOT NULL,
    [PresupuestoId]                 INT             NOT NULL,
    [DetallePresupuestoTipoGastoId] INT             NOT NULL,
    [DetallePresupuestoCosto]       DECIMAL (18, 2) NULL,
    [DetallePresupuestoActivo]      BIT             NOT NULL,
    CONSTRAINT [PK_DetallePresupuestoTable] PRIMARY KEY CLUSTERED ([DetallePresupuestoId] ASC),
    CONSTRAINT [FK_DetallePresupuestoTable_PresupuestoTable] FOREIGN KEY ([PresupuestoId]) REFERENCES [dbo].[PresupuestoTable] ([PresupuestoId]),
    CONSTRAINT [FK_DetallePresupuestoTable_TipoGastoTable] FOREIGN KEY ([DetallePresupuestoTipoGastoId]) REFERENCES [dbo].[TipoGastoTable] ([TipoGastoId])
);

