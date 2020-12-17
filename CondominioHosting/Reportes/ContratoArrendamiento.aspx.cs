using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;
using System.Web.Mvc;

namespace CondominioHosting.Reportes
{
    public partial class ContratoArrendamiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reportes/ReporteAlquiler.rdlc");

                //Esta parte varia segun el proyecto
                Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
                string fechaActual = DateTime.Now.ToString("yyyy-MM-dd");
                string codigoPropiedad = (string)Session["CodigoPropiedadR"];
                string condominioNombre = (string)Session["NombreCondominioR"];
                string direccionCondominio = (string)Session["DireccionCondominioR"];
                string sectorCondominio = (string)Session["SectorCondominioR"];
                string inquilinoActual = (string)Session["NombreInquilinoR"] + " " + (string)Session["ApellidoInquilinoR"];
                string inquilinoNacionalidad = (string)Session["NacionalidadInquilinoR"];
                string inquilinoDocumento = (string)Session["CedulaInquilinoR"];
                string inquilinoDireccion = (string)Session["DireccionInquilinoR"];
                decimal costoDecimal = (decimal)Session["CostoRentaR"];
                string costoPropiedad = costoDecimal.ToString("0.00");
                string propietarioCondominio = (string)Session["NombrePropietarioR"] + " " + (string)Session["ApellidoPropietarioR"];
                string propietarioNacionalidad = (string)Session["NacionalidadPropietarioR"];
                string propietarioDocumento = (string)Session["CedulaPropietarioR"];
                string propietarioDireccion = (string)Session["DireccionPropietarioR"];
                string fechaFinal = (string)Session["FechaFinal"];
                string abogadoNombre = (string)Session["NombreAbogado"];
                //fin
                ReportParameter fecha = new ReportParameter("FechaActual", fechaActual);
                ReportParameter codigo = new ReportParameter("CodigoPropiedad", codigoPropiedad);
                ReportParameter condominio = new ReportParameter("NombreCondominio", condominioNombre);
                ReportParameter direccion = new ReportParameter("Direccion", direccionCondominio);
                ReportParameter sector = new ReportParameter("SectorCondominio", sectorCondominio);
                ReportParameter inquilino = new ReportParameter("NombreInquilino", inquilinoActual);
                ReportParameter costo = new ReportParameter("CostoDeRenta", costoPropiedad);
                ReportParameter propietario = new ReportParameter("NombrePropietario", propietarioCondominio);
                ReportParameter nacionalidadP = new ReportParameter("NacionalidadPropietario", propietarioNacionalidad);
                ReportParameter documentoP = new ReportParameter("DocumentoPropietario", propietarioDocumento);
                ReportParameter direccionP = new ReportParameter("DireccionPropietario", propietarioDireccion);
                ReportParameter nacionalidadI = new ReportParameter("NacionalidadInquilino", inquilinoNacionalidad);
                ReportParameter documentoI = new ReportParameter("DocumentoInquilino", inquilinoDocumento);
                ReportParameter direccionI = new ReportParameter("DireccionInquilino", inquilinoDireccion);
                ReportParameter fechaF = new ReportParameter("FechaFinal", fechaFinal);
                ReportParameter abogado = new ReportParameter("NombreAbogado", abogadoNombre);

                ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { fecha, codigo, condominio, direccion, sector,
                    inquilino, costo, propietario, nacionalidadP, documentoP, direccionP, nacionalidadI, documentoI, direccionI,
                fechaF, abogado });
                //ReportViewer1.DataBind();
                ReportViewer1.LocalReport.Refresh();

            }

        }

        private void ShowReport()
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Pago");
        }
    }
}