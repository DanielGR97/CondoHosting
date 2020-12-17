<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContratoArrendamiento.aspx.cs" Inherits="CondominioHosting.Reportes.ContratoArrendamiento" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        #ReportViewer{
            text-align:justify;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
        <br />
    
         <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Volver" Width="65px" />
    
         <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="1000px"> </rsweb:ReportViewer>
    </div>
        
    </form>
</body>
</html>
