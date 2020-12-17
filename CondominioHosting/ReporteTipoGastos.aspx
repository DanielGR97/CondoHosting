<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteTipoGastos.aspx.cs" Inherits="CondominioHosting.ReporteTipoGastos" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        header{
            background-color: lightblue;
        }

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
        .drop{
            position: relative;
            margin-left: 15px;
            border-radius: 3px;
            width: 200px;
            height: 35px;
            bottom: 10px;
        }
        .names{
          font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 18px;
            padding-top: 20px;

            
            
        }
        #todos{
            margin-top: 20px;
            margin-left: 20px;
            background-color: lightblue;
            height: 50px;
        }

    </style>
</head>
   
<body>
    <header>
         <form action="" method="post">
        <h2>Tipos de gastos</h2>
        <label class="names">Campos a buscar:</label>
        <div id="todos">
        <label class="names">Fecha pasada:</label>
        <input type="date" name="fechaIni" class="drop" />

        <label class="names">Fecha actual:</label>
        <input type="date" name="fechaFin" class="drop"/>

        <input type="submit" id="buscar" value="Buscar Estado"/>
        </div>
    </form>
    </header>
   
    <form id="form1" runat="server">
    <div>
    
    </div>
        <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server"></rsweb:ReportViewer>
        
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </form>
</body>
</html>
