using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
namespace CondominioHosting
{
    public partial class ReporteEmpleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportEmpledados.LocalReport.ReportPath = Server.MapPath("/ReportEmpleado.rdlc");

                //Esta parte varia segun el proyecto
                Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();

                var laborando = Convert.ToBoolean(Request.Form["laborando"]);
                int IdCondominio = (int)Session["CondominioId"];
                var data = db.EmpleadosActivos(laborando, IdCondominio);
                //fin

                ReportDataSource RDS = new ReportDataSource("DataSetEmpleados", data);

                ReportEmpledados.LocalReport.DataSources.Add(RDS);
                //ReportViewer1.DataBind();
                ReportEmpledados.LocalReport.Refresh();
            }
        }
    }
}