using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class PagoController : Controller
    {
        // GET: Pago
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        [Authorize(Roles = "Admin,Inquilino")]
        public ActionResult Index()
        {

            string NombrePersona = (string)Session["PersonaNombre"];
            string CondominioPersona = (string)Session["PersonaCondominio"];
            int IdPersona = (int)Session["PersonaId"];
            int IdTipoPersona = (int)Session["PersonaTipoId"];
            int IdCondominio = (int)Session["CondominioId"];

            ViewBag.UsuarioNombre = NombrePersona;
            ViewBag.CondominioNombre = CondominioPersona;
            ViewBag.CondominioId = IdCondominio;
            ViewBag.servicios = db.BusquedaServicioProProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.inqui = db.BusquedaInquilinoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.propi = db.ComboBoxPropiedadDisponibleProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.empleado = db.BusquedaEmpleadoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.HistorialAlquiladoTable historial)
        {
            db.HistorialAlquiladoTables.InsertOnSubmit(historial);

            var t = db.PropiedadTables.Where(x => x.PropiedadId == historial.HistorialAlquiladoPropiedadId).FirstOrDefault();
            t.PropiedadInquilinoId = historial.HistorialAlquiladoInquilinoId;


            db.SubmitChanges();

            string NombrePersona = (string)Session["PersonaNombre"];
            string CondominioPersona = (string)Session["PersonaCondominio"];
            int IdPersona = (int)Session["PersonaId"];
            int IdTipoPersona = (int)Session["PersonaTipoId"];
            int IdCondominio = (int)Session["CondominioId"];

            ViewBag.UsuarioNombre = NombrePersona;
            ViewBag.CondominioNombre = CondominioPersona;
            ViewBag.CondominioId = IdCondominio;
            ViewBag.inqui = db.BusquedaInquilinoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.propi = db.ComboBoxPropiedadDisponibleProc(IdPersona, IdTipoPersona, IdCondominio).ToList();

            var s = db.CondominioTables.Where(x => x.CondominioId == t.PropiedadCondominioId).FirstOrDefault();
            var i = db.PersonaTables.Where(x => x.PersonaId == historial.HistorialAlquiladoInquilinoId).FirstOrDefault();
            var a = db.PersonaTables.Where(x => x.PersonaId == historial.HistorialAlquiladoAbogadoId).FirstOrDefault();

            Session["CodigoPropiedadR"] = t.PropiedadCodigo;
            Session["NombreCondominioR"] = s.CondominioNombre;
            Session["DireccionCondominioR"] = s.CondominioDireccion;
            Session["SectorCondominioR"] = s.SectorTable.SectorDescripcion;
            Session["NombreInquilinoR"] = i.PersonaNombre;
            Session["ApellidoInquilinoR"] = i.PersonaApellido;
            Session["NacionalidadInquilinoR"] = i.NacionalidadTable.NacionalidadNombre;
            Session["CedulaInquilinoR"] = i.PersonaDocumento;
            Session["DireccionInquilinoR"] = i.PersonaDireccion;
            Session["CostoRentaR"] = t.PropiedadPrecio;
            Session["NombrePropietarioR"] = s.PersonaTable.PersonaNombre;
            Session["ApellidoPropietarioR"] = s.PersonaTable.PersonaApellido;
            Session["NacionalidadPropietarioR"] = s.PersonaTable.NacionalidadTable.NacionalidadNombre;
            Session["CedulaPropietarioR"] = s.PersonaTable.PersonaDocumento;
            Session["DireccionPropietarioR"] = s.PersonaTable.PersonaDireccion;
            Session["FechaFinal"] = historial.HistorialAlquiladoFechaTerminacion.ToString("MM/dd/yyyy");
            Session["NombreAbogado"] = a.PersonaNombre + " " + a.PersonaApellido;
            //return RedirectToAction("Index","Pago");
            return Redirect("~/Reportes/ContratoArrendamiento.aspx");
        }

        [Authorize(Roles = "Admin,Inquilino")]
        public ActionResult Asignado()
        {

            string NombrePersona = (string)Session["PersonaNombre"];
            string CondominioPersona = (string)Session["PersonaCondominio"];

            ViewBag.UsuarioNombre = NombrePersona;
            ViewBag.CondominioNombre = CondominioPersona;

            return View();
        }

        public ActionResult CambiarCombo(int condominio)
        {
            var t = db.PersonaTables.Where(x => x.PersonaId == condominio).FirstOrDefault();

            int? IdCondo = t.PersonaCondominioId;

            var comboList = db.PropiedadTables.Where(s => s.PropiedadCondominioId.Equals(IdCondo) && s.PropiedadActivo == true && s.PropiedadInquilinoId == null)
                .Select(a => new
                {
                    PropiedadId = a.PropiedadId,
                    PropiedadCodigo = a.PropiedadCodigo
                });
            //ViewBag.tipoIngreso = comboList;

            return Json(comboList, JsonRequestBehavior.AllowGet);

        }

        public ActionResult ObtenerDatos(int Id)
        {
            var comboList = db.DetalleServicioProIds.Where(s => s.PropiedadId.Equals(Id))
                .Select(a => new
                {
                    DetalleServicioId = a.DetalleServicioId,
                    ServicioDescripcion = a.ServicioTable.ServicioDescripcion,
                    PropiedadId = a.PropiedadId
                });

            return Json(comboList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AgregarDetalle(int Id, int ServicioId)
        {
            if (db.DetalleServicioProIds.Any(u => u.PropiedadId == Id && u.ServicioId == ServicioId))
            {
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                CondominioHosting.Models.DetalleServicioProId data = new CondominioHosting.Models.DetalleServicioProId
                {
                    ServicioId = ServicioId,
                    PropiedadId = Id
                };

                db.DetalleServicioProIds .InsertOnSubmit(data);
                db.SubmitChanges();

                return Json(new { success = true, DetalleServicioId = data.DetalleServicioId }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult EliminarDetalle(int Id)
        {
            var t = db.DetalleServicioProIds.Where(x => x.DetalleServicioId == Id).FirstOrDefault();
            db.DetalleServicioProIds.DeleteOnSubmit(t);
            db.SubmitChanges();

            return new JsonResult { Data = "hola", JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public ActionResult Renta()
        {
            string NombrePersona = (string)Session["PersonaNombre"];
            string CondominioPersona = (string)Session["PersonaCondominio"];
            int IdPersona = (int)Session["PersonaId"];
            int IdTipoPersona = (int)Session["PersonaTipoId"];
            int IdCondominio = (int)Session["CondominioId"];

            ViewBag.UsuarioNombre = NombrePersona;
            ViewBag.CondominioNombre = CondominioPersona;
            ViewBag.CondominioId = IdCondominio;
            ViewBag.listado = db.BusquedaIngresosRentaProc(IdPersona, IdTipoPersona, IdCondominio, DateTime.Now).ToList();
            ViewBag.tipoIngreso = db.BusquedaTipoIngresoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.propiedad = db.ComboBoxPropiedadNoDisponibleProc(IdPersona, IdTipoPersona, IdCondominio, DateTime.Now).ToList();

            return View();
        }

        [HttpPost]
        public ActionResult Renta(Models.IngresoTable ingresos)
        {
            var inquilino = db.PersonaTables.Where(x => x.PersonaId == ingresos.IngresoInquilinoId).FirstOrDefault();

            decimal renta = 0;

            var comboList = db.PropiedadTables.Where(s => s.PropiedadActivo == true && s.PropiedadInquilinoId == ingresos.IngresoInquilinoId)
                .Select(a => new
                {
                    cantidad = a.PropiedadPrecio
                });

            foreach (var c in comboList)
            {
                renta += c.cantidad;
            }

            ingresos.CondominioId = inquilino.PersonaCondominioId;
            ingresos.IngresoDescripcion = "Renta de inquilino " + inquilino.PersonaNombre + " " + inquilino.PersonaApellido;
            ingresos.IngresoFecha = DateTime.Now;
            ingresos.IngresoCantidad = renta;
            db.IngresoTables.InsertOnSubmit(ingresos);
            db.SubmitChanges();

            return RedirectToAction("Renta", "Pago");
        }


        public ActionResult CambiarRenta(int idPropiedad)
        {

            var cantidad = db.PropiedadTables.Where(x => x.PropiedadId == idPropiedad).FirstOrDefault();

            var inquilino = db.PersonaTables.Where(x => x.PersonaId == cantidad.PropiedadInquilinoId).FirstOrDefault();

            return Json(new { cantidad = cantidad.PropiedadPrecio, inquilino = inquilino.PersonaNombre + " " + inquilino.PersonaApellido, inquilinoId = inquilino.PersonaId }, JsonRequestBehavior.AllowGet);

        }

    }
}