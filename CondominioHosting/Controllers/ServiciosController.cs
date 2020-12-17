using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class ServiciosController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Servicios
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
            ViewBag.listado = db.BusquedaServicioProProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.ServicioTable servicio)
        {
            db.ServicioTables.InsertOnSubmit(servicio);
            db.SubmitChanges();

            return RedirectToAction("Index", "Servicios");
        }


        public ActionResult ObtenerDatos(int Id)
        {
            var t = db.ServicioTables.Where(x => x.ServicioId == Id).FirstOrDefault();

            return new JsonResult
            {
                Data = new
                {
                    descripcion = t.ServicioDescripcion,
                    costo = t.ServicioGasto

                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, string descripcion, decimal costo)
        {
            var t = db.ServicioTables.Where(x => x.ServicioId == Id).FirstOrDefault();
            t.ServicioDescripcion = descripcion;
            t.ServicioGasto = costo;
            db.SubmitChanges();

            return RedirectToAction("Index", "Servicios");
        }
    }
}