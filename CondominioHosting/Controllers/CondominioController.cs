using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class CondominioController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Condominio
        [Authorize(Roles = "Admin")]
        public ActionResult Index()
        {
            string NombrePersona = (string)Session["PersonaNombre"];
            string CondominioPersona = (string)Session["PersonaCondominio"];
            int IdPersona = (int)Session["PersonaId"];

            ViewBag.UsuarioNombre = NombrePersona;
            ViewBag.IdPersona = IdPersona;
            ViewBag.listado = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.sectores = db.SectorTables.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.CondominioTable condominio)
        {
            db.CondominioTables.InsertOnSubmit(condominio);
            db.SubmitChanges();

            return RedirectToAction("Index", "Condominio");
        }

        public ActionResult ObtenerDatos(int Id)
        {
            var t = db.CondominioTables.Where(x => x.CondominioId == Id).FirstOrDefault();

            return new JsonResult { Data = new
                { nombre = t.CondominioNombre,
                  sector = t.CondominioSectorId,
                  direccion = t.CondominioDireccion,
                  telefono = t.CondominioTelefono,
                  descripcion = t.CondominioDescripcion},
                JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, string nombre, int sector, string direccion, string telefono, string descripcion)
        {
            var t = db.CondominioTables.Where(x => x.CondominioId == Id).FirstOrDefault();
            t.CondominioNombre = nombre;
            t.CondominioSectorId = sector;
            t.CondominioDireccion = direccion;
            t.CondominioTelefono = telefono;
            t.CondominioDescripcion = descripcion;
            db.SubmitChanges();

            return RedirectToAction("Index", "Condominio");
        }

    }
}