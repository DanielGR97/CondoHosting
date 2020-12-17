using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace CondominioHosting
{
    public partial class InquilnosActivos : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                ReportInquilinos.LocalReport.ReportPath = Server.MapPath("/ReportInquilinos.rdlc");

                //Esta parte varia segun el proyecto
                Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
                var viviendo = Convert.ToBoolean(Request.Form["viviendo"]);
                int IdCondominio = (int)Session["CondominioId"];
                var data = db.InquilinosCondominio(viviendo,IdCondominio);
                //fin
                ReportDataSource RDS = new ReportDataSource("DataSetInquilinos", data);

                ReportInquilinos.LocalReport.DataSources.Add(RDS);
                //ReportViewer1.DataBind();
                ReportInquilinos.LocalReport.Refresh();
            }
    
        }
    }
}