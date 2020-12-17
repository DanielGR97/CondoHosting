<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Presupuesto.aspx.cs" Inherits="CondominioHosting.Reportes.Presupuesto" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form action="" method="post">
        <h2>Presupuesto</h2>
        <label>Fecha pasada:</label>
        <input type="date" name="fechaIni"/>
        <label>Fecha actual:</label>
        <input type="date" name="FechaFin"/>
        <input type="submit" />
    </form>
    <form id="form1" runat="server">
    <div>
        <rsweb:ReportViewer ID="ReportPresupuesto" runat="server" Width="100%"></rsweb:ReportViewer>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </div>
    </form>
</body>
</html>
