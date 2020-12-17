<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportePropiedades.aspx.cs" Inherits="CondominioHosting.ReportePropiedades" %>

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
        <h2>Estado de mis propiedades</h2>
        <label id="names" for="alquiladas">Propiedades</label>
        <select name="alquiladas"> 
            <option value="True">Alquiladas</option>
            <option value="False">Vacias</option>
        </select>
        <input type="submit" id="buscar" value="Buscar Propiedades"/>
    </form>
    <form id="form1" runat="server">
    <div>
         <rsweb:ReportViewer ID="ReportViewerProp" Width="100%" runat="server"></rsweb:ReportViewer>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    </div>
       
    </form>
</body>
</html>
