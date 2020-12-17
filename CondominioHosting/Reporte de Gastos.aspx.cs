using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace CondominioHosting.Reportes
{
    public partial class Reporte_de_Gastos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewerGastos.LocalReport.ReportPath = Server.MapPath("/ReportG.rdlc");

                //Esta parte varia segun el proyecto
                Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();

                var fechain = Convert.ToDateTime(Request.Form["fechain"]);
                var fechaLim =  Convert.ToDateTime(Request.Form["fechaLim"]);
                int IdCondominio = (int)Session["CondominioId"];
                var data = db.BuscarGastos(fechain, fechaLim,IdCondominio);
                //fin

                ReportDataSource RDS = new ReportDataSource("DataSetGastos", data);

                ReportViewerGastos.LocalReport.DataSources.Add(RDS);
                //ReportViewer1.DataBind();
                ReportViewerGastos.LocalReport.Refresh();

            }
        }
    }
}