using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class TipoGastosController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: TipoGastos
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
            ViewBag.listado = db.BusquedaTipoGastoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.TipoGastoTable tipoGasto)
        {
            db.TipoGastoTables.InsertOnSubmit(tipoGasto);
            db.SubmitChanges();

            return RedirectToAction("Index", "TipoGastos");
        }

        public ActionResult ObtenerDatos(int Id)
        {
            var t = db.TipoGastoTables.Where(x => x.TipoGastoId == Id).FirstOrDefault();

            return new JsonResult
            {
                Data = new
                {
                    descripcion = t.TipoGastoDescripcion,
                    fijo = t.TipoGastoFijo
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, string descripcion, bool fijo)
        {
            var t = db.TipoGastoTables.Where(x => x.TipoGastoId == Id).FirstOrDefault();
            t.TipoGastoDescripcion = descripcion;
            t.TipoGastoFijo = fijo;
            db.SubmitChanges();

            return RedirectToAction("Index", "TipoGastos");
        }
    }
}