<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportContratistas.aspx.cs" Inherits="CondominioHosting.ReportContratistas" %>

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
        select{
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
        <h2>Contratistas en servicio</h2>
        <label id="names" for="laborando">Contratistas Laborando</label>
        <select name="type">
            <option value="true">En servicio</option>
            <option value="false">Fuera de servicio</option>
        </select>
        <input type="submit" id="buscar" value="Buscar Contratistas"/>
    </form>
    <form id="form1" runat="server">
    <div>
        <rsweb:ReportViewer ID="ReportViewerContra" runat="server" Width="100%"></rsweb:ReportViewer>
   
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    </div>
    </form>
</body>
</html>
