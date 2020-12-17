using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class InstalacionesController : Controller
    {

        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Instalaciones
        [Authorize(Roles = "Admin,Instalaciones")]
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
            ViewBag.listado = db.BusquedaInstalacionProc(IdPersona,IdTipoPersona,IdCondominio).ToList();
            ViewBag.condominios = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.tipint = db.TipoInstalacionTables.ToList();
            ViewBag.per = db.PersonaTables.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.InstalacionTable instala)
        {
            db.InstalacionTables.InsertOnSubmit(instala);
            db.SubmitChanges();

            return RedirectToAction("Index", "Instalaciones");
        }

        [HttpPost]
        public ActionResult Deshacer(int Id)
        {
            var t = db.InstalacionTables.Where(x => x.InstalacionId == Id).FirstOrDefault();
            t.InstalacionActivo = false;
            db.SubmitChanges();

            return RedirectToAction("Index", "Instalaciones");
        }

        public ActionResult ObtenerDatos(int Id)
        {
            var t = db.InstalacionTables.Where(x => x.InstalacionId == Id).FirstOrDefault();

            return new JsonResult
            {
                Data = new
                {
                    tipo = t.InstalacionTipoId,
                    descripcion = t.InstalacionDescripcion,
                    horaI = t.InstalacionHorarioInicial,
                    horaF = t.InstalacionHorarioFinal
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, int tipo, string descripcion, TimeSpan horaI, TimeSpan horaF)
        {
            var t = db.InstalacionTables.Where(x => x.InstalacionId == Id).FirstOrDefault();
            t.InstalacionTipoId = tipo;
            t.InstalacionDescripcion = descripcion;
            t.InstalacionHorarioInicial = horaI;
            t.InstalacionHorarioFinal = horaF;
            db.SubmitChanges();

            return RedirectToAction("Index", "Instalaciones");
        }
    }
}