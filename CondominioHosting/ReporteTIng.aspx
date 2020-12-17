<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteTIng.aspx.cs" Inherits="CondominioHosting.ReporteTIng" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
          header{
            background-color: lightblue;
            background-size: 100px;
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
            padding-left: 7px;
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
        <h2>Tipos de Ingresos de mi condominios</h2> 
        
       <asp:label Font-Italic="True" CssClass="names" runat="server">Campos a buscar:</asp:label> 
        <div id="todo">
        <label>Fecha Pasada:</label>
        <input type="date" name="fechaIni" class="drop"/>

        <label>Fecha actual:</label>
        <input type="date" name="fechaFin" class="drop"/>

        <input type="submit" id="buscar" value="Buscar"/>
             </div>
    </form>
       
        </header>
    <form id="form1" runat="server">
    <div>
        <rsweb:ReportViewer ID="ReportViewer1" width="100%" runat="server"></rsweb:ReportViewer>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </div>
    </form>
        
</body>
</html>
