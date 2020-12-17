using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class PropiedadesController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Propiedades
        [Authorize(Roles = "Admin,Propiedades")]
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
            ViewBag.listado = db.BusquedaPropiedadProc(IdPersona,IdTipoPersona,IdCondominio).ToList();
            ViewBag.condominios = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.inquilinos = db.BusquedaInquilinoProProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.servicios = db.BusquedaServicioProProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.PropiedadTable propiedades)
        {
            db.PropiedadTables.InsertOnSubmit(propiedades);
            
            db.SubmitChanges();

            return RedirectToAction("Index", "Propiedades");
        }

        [HttpPost]
        public ActionResult Deshacer(int Id)
        {
            var t = db.PropiedadTables.Where(x => x.PropiedadId == Id).FirstOrDefault();
            t.PropiedadActivo = false;
            db.SubmitChanges();

            return RedirectToAction("Index", "Propiedades");
        }

        public ActionResult ObtenerDatos(int Id)
        {
            var t = db.PropiedadTables.Where(x => x.PropiedadId == Id).FirstOrDefault();

            return new JsonResult
            {
                Data = new
                {
                    codigo = t.PropiedadCodigo,
                    descripcion = t.PropiedadDescripcion,
                    habitaciones = t.PropiedadHabitaciones,
                    banos = t.PropiedadBanos,
                    terraza = t.PropiedadTerraza,
                    precio = t.PropiedadPrecio
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, string codigo, string descripcion, byte habitaciones, byte banos, bool terraza, decimal precio)
        {
            var t = db.PropiedadTables.Where(x => x.PropiedadId == Id).FirstOrDefault();
            t.PropiedadCodigo = codigo;
            t.PropiedadDescripcion = descripcion;
            t.PropiedadHabitaciones = habitaciones;
            t.PropiedadBanos = banos;
            t.PropiedadTerraza = terraza;
            t.PropiedadPrecio = precio;
            db.SubmitChanges();

            return RedirectToAction("Index", "Propiedades");
        }

        public ActionResult ObtenerDatos2(int Id)
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

                db.DetalleServicioProIds.InsertOnSubmit(data);
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
    }
}