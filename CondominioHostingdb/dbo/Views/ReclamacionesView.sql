CREATE VIEW dbo.ReclamacionesView
AS
SELECT        dbo.ReclamacionTable.ReclamacionId, dbo.ReclamacionTable.ReclamacionPersonaId, CASE WHEN dbo.ReclamacionTable.ReclamacionSolucionado = 1 THEN 'Si' ELSE 'No' END AS ReclamacionSolucionado, 
                         dbo.ReclamacionTable.ReclamacionPropiedadId, dbo.ReclamacionTable.ReclamacionDescripcion,
                             (SELECT        MAX(PersonaNombre) AS Expr1
                               FROM            dbo.PersonaTable
                               WHERE        (dbo.ReclamacionTable.ReclamacionEmpleadoId = PersonaId)) AS EmpleadoNombre, dbo.ReclamacionTable.ReclamacionNota, dbo.ReclamacionTable.ReclamacionCosto, 
                         dbo.ReclamacionTable.ReclamacionActivo, dbo.PropiedadTable.PropiedadCodigo, PersonaTable_1.PersonaNombre
FROM            dbo.ReclamacionTable INNER JOIN
                         dbo.PersonaTable AS PersonaTable_1 ON dbo.ReclamacionTable.ReclamacionPersonaId = PersonaTable_1.PersonaId INNER JOIN
                         dbo.PropiedadTable ON dbo.ReclamacionTable.ReclamacionPropiedadId = dbo.PropiedadTable.PropiedadId
WHERE        (dbo.ReclamacionTable.ReclamacionActivo = 1)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ReclamacionesView';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[7] 2[34] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ReclamacionTable"
            Begin Extent = 
               Top = 47
               Left = 25
               Bottom = 177
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "PersonaTable_1"
            Begin Extent = 
               Top = 0
               Left = 303
               Bottom = 130
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PropiedadTable"
            Begin Extent = 
               Top = 186
               Left = 253
               Bottom = 316
               Right = 473
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2220
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'ReclamacionesView';



