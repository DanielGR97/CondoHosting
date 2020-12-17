using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class MantenimientoController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Mantenimiento
        [Authorize(Roles = "Propiedades,Instalaciones,Admin")]
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
            ViewBag.listado = db.BusquedaMantenimientoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.condo = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.tipint = db.BusquedaInstalacionProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.per = db.BusquedaEmpleadoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.propiedad = db.BusquedaPropiedadProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.MantenimientoTable mantenimiento)
        {
            db.MantenimientoTables.InsertOnSubmit(mantenimiento);
            db.SubmitChanges();


            return RedirectToAction("Index", "Mantenimiento");
        }

        [HttpPost]
        public ActionResult Deshacer(int Id)
        {
            var t = db.MantenimientoTables.Where(x => x.MantenimientoId == Id).FirstOrDefault();
            t.MantenimientoActivo = false;
            db.SubmitChanges();

            return RedirectToAction("Index", "Mantenimiento");
        }

        public ActionResult ObtenerDatos1(int Id)
        {
            var t = db.MantenimientoTables.Where(x => x.MantenimientoId == Id).FirstOrDefault();

            return new JsonResult
            {
                Data = new
                {
                    persona = t.MantenPersonaId,
                    instalacion = t.MantenInstalacionId,
                    descripcion = t.Descripcion,
                    fecha = t.MantenimientoFecha
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar1(int Id, int persona, int instalacion, string descripcion, DateTime fecha)
        {
            var t = db.MantenimientoTables.Where(x => x.MantenimientoId == Id).FirstOrDefault();
            t.MantenPersonaId = persona;
            t.MantenInstalacionId = instalacion;
            t.Descripcion = descripcion;
            t.MantenimientoFecha = fecha;

            db.SubmitChanges();

            return RedirectToAction("Index", "Mantenimiento");
        }

        public ActionResult ObtenerDatos2(int Id)
        {
            var t = db.MantenimientoTables.Where(x => x.MantenimientoId == Id).FirstOrDefault();

            return new JsonResult
            {
                Data = new
                {
                    persona = t.MantenPersonaId,
                    propiedad = t.MantenPropiedadId,
                    descripcion = t.Descripcion,
                    fecha = t.MantenimientoFecha
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar2(int Id, int persona, int propiedad, string descripcion, DateTime fecha)
        {
            var t = db.MantenimientoTables.Where(x => x.MantenimientoId == Id).FirstOrDefault();
            t.MantenPersonaId = persona;
            t.MantenPropiedadId = propiedad;
            t.Descripcion = descripcion;
            t.MantenimientoFecha = fecha;

            db.SubmitChanges();

            return RedirectToAction("Index", "Mantenimiento");
        }

        public ActionResult CambiarCombo(int condominio)
        {
            var comboList = db.PersonaTables.Where(s => s.PersonaCondominioId.Equals(condominio) && s.PersonaActivo == true && s.PersonaTipoId == 3)
                .Select(a => new
                {
                    PersonaId = a.PersonaId,
                    PersonaNombre = a.PersonaNombre,
                    PersonaApellido = a.PersonaApellido
                });
            //ViewBag.tipoIngreso = comboList;

            return Json(comboList, JsonRequestBehavior.AllowGet);

        }

        public ActionResult CambiarCombo2(int condominio)
        {
            var comboList = db.InstalacionTables.Where(s => s.InstalacionCondominioId.Equals(condominio) && s.InstalacionActivo == true)
                .Select(a => new
                {
                    InstalacionId = a.InstalacionId,
                    InstalacionDescripcion = a.InstalacionDescripcion
                });
            //ViewBag.tipoIngreso = comboList;

            return Json(comboList, JsonRequestBehavior.AllowGet);

        }

        public ActionResult CambiarCombo3(int condominio)
        {
            var comboList = db.PropiedadTables.Where(s => s.PropiedadCondominioId.Equals(condominio) && s.PropiedadActivo == true)
                .Select(a => new
                {
                    PropiedadCondominioId = a.PropiedadCondominioId,
                    PropiedadCodigo = a.PropiedadCodigo
                });
            //ViewBag.tipoIngreso = comboList;

            return Json(comboList, JsonRequestBehavior.AllowGet);

        }
    }
}