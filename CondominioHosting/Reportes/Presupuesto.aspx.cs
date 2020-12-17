using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace CondominioHosting.Reportes
{
    public partial class Presupuesto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportPresupuesto.LocalReport.ReportPath = Server.MapPath("/Reportes/ReportPresupuesto.rdlc");

                //Esta parte varia segun el proyecto
                Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
                int IdCondominio = (int)Session["CondominioId"];
                var fechaIni = Convert.ToDateTime(Request.Form["fechaIni"]);
                var fechaFin = Convert.ToDateTime(Request.Form["fechaFin"]);

                var data = db.PresupuestoProc(IdCondominio, fechaIni, fechaFin);
                //fin

                ReportDataSource RDS = new ReportDataSource("DataSetPresupuesto", data);

                ReportPresupuesto.LocalReport.DataSources.Add(RDS);
                //ReportViewer1.DataBind();
                ReportPresupuesto.LocalReport.Refresh();
                
            }

        }
    }
}