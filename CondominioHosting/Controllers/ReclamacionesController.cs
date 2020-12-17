using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class ReclamacionesController : Controller
    {
		Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Reclamaciones
        [Authorize(Roles = "Admin,Reclamaciones")]
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
            ViewBag.listado = db.BusquedaReclamacionProc(IdPersona,IdTipoPersona,IdCondominio).ToList();
			ViewBag.propiedad = db.BusquedaPropiedadProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
			ViewBag.inquilino = db.BusquedaInquilinoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.contratista = db.ComboBoxEmpleadoContratistaProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.condominio = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.tipo = db.TipoReclamacionTables.ToList();
            return View();
        }

		[HttpPost]
		public ActionResult Index(Models.ReclamacionTable reclamacion)
		{
			db.ReclamacionTables.InsertOnSubmit(reclamacion);
			db.SubmitChanges();

            return RedirectToAction("Index", "Reclamaciones");
		}

        [HttpPost]
        public ActionResult Deshacer(int Id)
        {
            var t = db.ReclamacionTables.Where(x => x.ReclamacionId == Id).FirstOrDefault();
            t.ReclamacionActivo = false;
            db.SubmitChanges();

            return RedirectToAction("Index", "Reclamaciones");
        }

        public ActionResult ObtenerDatos(int Id)
        {
            var t = db.ReclamacionTables.Where(x => x.ReclamacionId == Id).FirstOrDefault();

            return new JsonResult {  Data = new
                {   inquilino = t.ReclamacionPersonaId,
                    propiedad = t.ReclamacionPropiedadId,
                    descripcion = t.ReclamacionDescripcion },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public ActionResult ObtenerDatos2(int Id)
        {
            var t = db.ReclamacionTables.Where(x => x.ReclamacionId == Id).FirstOrDefault();

            return new JsonResult
            {
                Data = new
                {
                    empleado = t.ReclamacionEmpleadoId,
                    nota = t.ReclamacionNota,
                    costo = t.ReclamacionCosto,
                    tipo = t.ReclamacionTipoId
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, int inquilino, int propiedad, string descripcion)
        {
            var t = db.ReclamacionTables.Where(x => x.ReclamacionId == Id).FirstOrDefault();
            t.ReclamacionPersonaId = inquilino;
            t.ReclamacionPropiedadId = propiedad;
            t.ReclamacionDescripcion = descripcion;
            db.SubmitChanges();

            return RedirectToAction("Index", "Reclamaciones");
        }

        [HttpPost]
        public ActionResult Modificar2(int Id, int empleado, string nota, decimal costo, int tipo)
        {
            var t = db.ReclamacionTables.Where(x => x.ReclamacionId == Id).FirstOrDefault();
            t.ReclamacionEmpleadoId = empleado;
            t.ReclamacionNota = nota;
            t.ReclamacionCosto = costo;
            t.ReclamacionTipoId = tipo;
            db.SubmitChanges();

            return RedirectToAction("Index", "Reclamaciones");
        }

        public ActionResult CambiarCombo(int condominio)
        {
            var comboList = db.PersonaTables.Where(s => s.PersonaCondominioId.Equals(condominio) && s.PersonaActivo == true && s.PersonaTipoId == 1)
                .Select(a => new
                {
                    PersonaId = a.PersonaId,
                    PersonaNombre = a.PersonaNombre
                });
            //ViewBag.tipoIngreso = comboList;

            return Json(comboList, JsonRequestBehavior.AllowGet);

        }

        public ActionResult CambiarCombo2(int inquilino)
        {
            var comboList = db.PropiedadTables.Where(s => s.PropiedadInquilinoId.Equals(inquilino) && s.PropiedadActivo == true)
                .Select(a => new
                {
                    PropiedadId = a.PropiedadId,
                    PropiedadCodigo = a.PropiedadCodigo
                });
            //ViewBag.tipoIngreso = comboList;

            return Json(comboList, JsonRequestBehavior.AllowGet);

        }
    }
}