CREATE TABLE [dbo].[PresupuestoTable] (
    [PresupuestoId]           INT  IDENTITY (1, 1) NOT NULL,
    [PresupuestoCondominioId] INT  NOT NULL,
    [PresupuestoFecha]        DATE NOT NULL,
    [PresupuestoActivo]       BIT  NOT NULL,
    CONSTRAINT [PK_PresupuestoTable] PRIMARY KEY CLUSTERED ([PresupuestoId] ASC),
    CONSTRAINT [FK_PresupuestoTable_CondominioTable] FOREIGN KEY ([PresupuestoCondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId])
);

