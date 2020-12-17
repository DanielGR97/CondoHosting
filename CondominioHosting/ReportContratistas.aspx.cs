using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
namespace CondominioHosting
{
    public partial class ReportContratistas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewerContra.LocalReport.ReportPath = Server.MapPath("/ReportContratistas.rdlc");

                //Esta parte varia segun el proyecto
                Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
                int IdCondominio = (int)Session["CondominioId"];
                var type = Convert.ToBoolean(Request.Form["type"]);
                
                var data = db.contratistasActivos(type, IdCondominio);
                //fin

                ReportDataSource RDS = new ReportDataSource("DataSetContratistas", data);

                ReportViewerContra.LocalReport.DataSources.Add(RDS);
                //ReportViewer1.DataBind();
                ReportViewerContra.LocalReport.Refresh();
            }
        }

    }
}