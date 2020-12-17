<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InquilnosActivos.aspx.cs" Inherits="CondominioHosting.InquilnosActivos" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
          header{
            background-color: lightblue;
            height: -100px;
        }

        h2{
            text-align: center;
            background-color: lightblue;
            width: 100%;
            height: 100%;
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
        #todo{
            height: 100%;
            width: 100%;
            background-color: lightblue;
            position: relative;
            top:-10px;
        }
         </style>
</head>
<body>
    <form action="" method="post">
        <div id="todo">
        <h2>Inquilinos en el Condominio</h2>
        <header>
        <label id="names" for="Viviendo" class="names">Estado del inquilino</label>
        <select name="Viviendo" class="drop">
            <option value="true">En el condominio</option>
            <option value="false">Fuera del condominio</option>
        </select>
        <input type="submit" id="buscar" value="Buscar inquilinos"/>
            </header>
            </div>
    </form>
    <form id="form1" runat="server">
    <div>
    <rsweb:ReportViewer ID="ReportInquilinos" runat="server" Width="100%" ></rsweb:ReportViewer>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </div>
    </form>
    
</body>
</html>
