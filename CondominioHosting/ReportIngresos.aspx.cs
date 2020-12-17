﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.Reporting.WebForms;
using System.Web.UI.WebControls;

namespace CondominioHosting
{
    public partial class ReportIngresos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("/Report1.rdlc");

                Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
                var data = db.IngresoTables.ToList();

                ReportDataSource RDS = new ReportDataSource("DataSet1", data);

                ReportViewer1.LocalReport.DataSources.Add(RDS);

                ReportViewer1.LocalReport.Refresh();
            }
            
        }
    }
}