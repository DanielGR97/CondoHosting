using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace CondominioHosting
{
    public partial class ReporteIngresos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewerIng.LocalReport.ReportPath = Server.MapPath("/ReportIngresos.rdlc");

                //Esta parte varia segun el proyecto
                Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();

                
                DateTime  fi = Convert.ToDateTime(Request.Form["fi"]);
                DateTime ff = Convert.ToDateTime(Request.Form["ff"]);
                int IdCondominio = (int)Session["CondominioId"];

                var data = db.BuscarIngresos(fi, ff, IdCondominio);
                //fin

                ReportDataSource RDS = new ReportDataSource("DataSetIngresos", data);

                ReportViewerIng.LocalReport.DataSources.Add(RDS);
                //ReportViewer1.DataBind();
                ReportViewerIng.LocalReport.Refresh();

            }
        }
    }
}