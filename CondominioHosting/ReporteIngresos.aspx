<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteIngresos.aspx.cs" Inherits="CondominioHosting.ReporteIngresos" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         h2{
            text-align: center;
        }
        #buscar{
            position:relative;
            margin-left: 20px;
            border-color: limegreen;
            background-color: limegreen;
            margin-bottom: 10px;
            border-radius: 3px;
            width: 200px;
            height: 35px;
            bottom: 10px;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 16px;
            font-style: oblique;
        }
        .fecha{
            position: relative;
            margin-left: 15px;
            border-radius: 3px;
            width: 200px;
            height: 35px;
            bottom: 10px;
        }
        #names{
          font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 22px;
            font-style: oblique;
        }
    </style>
</head>
<body>
    <form action="" method="post">

        <h2>Estado de los Ingresos</h2>
        <label for="fi">Fecha Pasada</label>
        <input type="date" class="fecha" name="fi" /> 
        <label for="ff">Fecha actual</label>
       <input type="date" class="fecha" name="ff" /> 
        <input type="submit" id="buscar" value="Buscar Ingresos" />
    </form>
    
    <form id="form1" runat="server">
    <div>

        <rsweb:ReportViewer ID="ReportViewerIng"  Width="100%" runat="server"></rsweb:ReportViewer>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </div>
    </form>
</body>
</html>
