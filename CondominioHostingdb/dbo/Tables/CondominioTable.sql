CREATE TABLE [dbo].[CondominioTable] (
    [CondominioId]            INT           IDENTITY (1, 1) NOT NULL,
    [CondominioNombre]        VARCHAR (50)  NOT NULL,
    [CondominioTelefono]      VARCHAR (15)  NOT NULL,
    [CondominioDescripcion]   VARCHAR (MAX) NULL,
    [CondominioDireccion]     VARCHAR (MAX) NOT NULL,
    [CondominioMembresiaId]   INT           NULL,
    [CondominioSectorId]      INT           NOT NULL,
    [CondominioPropietarioId] INT           NULL,
    CONSTRAINT [PK_CondominioTable] PRIMARY KEY CLUSTERED ([CondominioId] ASC),
    CONSTRAINT [FK_CondominioTable_MembresiaTable] FOREIGN KEY ([CondominioMembresiaId]) REFERENCES [dbo].[MembresiaTable] ([MembresiaId]),
    CONSTRAINT [FK_CondominioTable_PersonaTable] FOREIGN KEY ([CondominioPropietarioId]) REFERENCES [dbo].[PersonaTable] ([PersonaId]),
    CONSTRAINT [FK_CondominioTable_SectorTable] FOREIGN KEY ([CondominioSectorId]) REFERENCES [dbo].[SectorTable] ([SectorId])
);







