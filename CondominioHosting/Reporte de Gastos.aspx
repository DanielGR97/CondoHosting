<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reporte de Gastos.aspx.cs" Inherits="CondominioHosting.Reportes.Reporte_de_Gastos" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CondominioHosting</title>

    <style>

        h2{
            text-align: center;
        }
        #buscar{
            position:relative;
            margin-left: 20px;
            margin-bottom: 10px;
            border-color: limegreen;
            background-color: limegreen;
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
            border-radius: 5px;
            width: 200px;
            height: 35px;
            bottom: 10px;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 16px;
        }
        .names{
          font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 18px;
            font-style: oblique;
            margin-left: 5px;
        }

    </style>
    
</head>
<body>
     <form action="" method="post">

        <h2>Estado de los Gastos</h2>
        <label for="Fechain" class="names">Fecha Pasada:</label>
        <input type="date" class="fecha " name="Fechain"/> 
        <label for="FechaLim" class="names">Fecha actual:</label>
       <input type="date" class="fecha" name="FechaLim" /> 
        <input type="submit" id="buscar" value="Buscar Gastos" />
    </form>

    <%--<form action="" method="post">
         
       <label>Fecha Pasada</label> <input type="date" name="Fechain" />
    <input type="date" name="FechaLim"  />
         <label>Fecha Actual</label><input type="submit" value="Buscar" />

    </form>--%>

    <form id="form1" runat="server">
    <div>
        

        <rsweb:ReportViewer ID="ReportViewerGastos" width="100%" runat="server"></rsweb:ReportViewer>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


        &nbsp;</div>
    </form>
    <form>
        &nbsp;</form>

</body>
</html>
