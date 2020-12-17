CREATE TABLE [dbo].[IngresoTable] (
    [IngresoId]            INT             IDENTITY (1, 1) NOT NULL,
    [IngresoDescripcion]   VARCHAR (50)    NOT NULL,
    [IngresoTipoIngresoId] INT             NOT NULL,
    [IngresoFecha]         DATE            NOT NULL,
    [IngresoCantidad]      DECIMAL (18, 2) NOT NULL,
    [IngresoActivo]        BIT             NOT NULL,
    [IngresoInquilinoId]   INT             NULL,
    [CondominioId]         INT             NULL,
    [HistorialAlquiladoId] INT             NULL,
    [Num]                  INT             NULL,
    CONSTRAINT [PK_IngresoTable] PRIMARY KEY CLUSTERED ([IngresoId] ASC),
    CONSTRAINT [FK_IngresoTable_CondominioTable] FOREIGN KEY ([CondominioId]) REFERENCES [dbo].[CondominioTable] ([CondominioId]),
    CONSTRAINT [FK_IngresoTable_HistorialAlquiladoTable] FOREIGN KEY ([HistorialAlquiladoId]) REFERENCES [dbo].[HistorialAlquiladoTable] ([HistorialAlquiladoId]),
    CONSTRAINT [FK_IngresoTable_IngresoTable] FOREIGN KEY ([IngresoId]) REFERENCES [dbo].[IngresoTable] ([IngresoId]),
    CONSTRAINT [FK_IngresoTable_InquilinoTable] FOREIGN KEY ([IngresoInquilinoId]) REFERENCES [dbo].[PersonaTable] ([PersonaId]),
    CONSTRAINT [FK_IngresoTable_TipoIngresoTable] FOREIGN KEY ([IngresoTipoIngresoId]) REFERENCES [dbo].[TipoIngresoTable] ([TipoIngresoId])
);







