using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class TipoIngresosController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: TipoIngresos
        [Authorize(Roles = "Admin,IngresosYGastos")]
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
            ViewBag.condominios = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.listado = db.BusquedaTipoIngresoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.TipoIngresoTable tipoIngreso)
        {

                db.TipoIngresoTables.InsertOnSubmit(tipoIngreso);
                db.SubmitChanges();

            return RedirectToAction("Index", "TipoIngresos");
            
        }
        public ActionResult ObtenerDatos(int Id)
        {
            var t = db.TipoIngresoTables.Where(x => x.TipoIngresoId == Id).FirstOrDefault();
            
            return new JsonResult { Data = t.TipoIngresoDescripcion, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, string descripcion)
        {
            var t = db.TipoIngresoTables.Where(x => x.TipoIngresoId == Id).FirstOrDefault();
            t.TipoIngresoDescripcion = descripcion;
            db.SubmitChanges();

            return RedirectToAction("Index", "TipoIngresos");
        }

      
    }
}