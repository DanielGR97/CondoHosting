using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
namespace CondominioHosting
{
    public partial class ReportePropiedades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewerProp.LocalReport.ReportPath = Server.MapPath("/ReportPropiedadesAlquiladas.rdlc");

                //Esta parte varia segun el proyecto
                Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();

                var alquiladas = Convert.ToBoolean(Request.Form["alquiladas"]);
                int IdCondominio = (int)Session["CondominioId"];


                var data = db.PropiedadesAlquiladas(alquiladas, IdCondominio);
                //fin

                ReportDataSource RDS = new ReportDataSource("DataSetPropAl", data);

                ReportViewerProp.LocalReport.DataSources.Add(RDS);
                //ReportViewer1.DataBind();
                ReportViewerProp.LocalReport.Refresh();

            }
        }
    }
}