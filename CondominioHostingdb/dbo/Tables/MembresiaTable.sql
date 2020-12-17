CREATE TABLE [dbo].[MembresiaTable] (
    [MembresiaId]               INT             IDENTITY (1, 1) NOT NULL,
    [MembresiaNombre]           VARCHAR (15)    NOT NULL,
    [MembresiaDescripcion]      VARCHAR (15)    NOT NULL,
    [MembresiaPrecio]           DECIMAL (18, 2) NOT NULL,
    [MembresiaCantidadUsuarios] INT             NOT NULL,
    [MembresiaActivo]           BIT             NOT NULL,
    CONSTRAINT [PK_MembresiaTable] PRIMARY KEY CLUSTERED ([MembresiaId] ASC)
);

