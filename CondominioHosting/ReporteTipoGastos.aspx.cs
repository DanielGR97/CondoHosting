using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
namespace CondominioHosting
{
    public partial class ReporteTipoGastos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("/ReportTipoGastos.rdlc");

                //Esta parte varia segun el proyecto
                Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();


                int IdCondominio = (int)Session["CondominioId"];
                var fechaIni = Convert.ToDateTime(Request.Form["fechaIni"]);
                var fechaFin = Convert.ToDateTime(Request.Form["fechaFin"]);

                var data = db.BuscartipoGastos(IdCondominio, fechaIni, fechaFin);
                //fin

                ReportDataSource RDS = new ReportDataSource("DataSetTg", data);

                ReportViewer1.LocalReport.DataSources.Add(RDS);
                //ReportViewer1.DataBind();
                ReportViewer1.LocalReport.Refresh();

            }

        }
    }
}