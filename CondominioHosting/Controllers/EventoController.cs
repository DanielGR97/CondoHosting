using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class EventoController : Controller
    {
        // GET: Evento
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        [Authorize(Roles = "Admin,Eventos")]
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

            ViewBag.eventos = db.BusquedaEventoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.condominio = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.inqui = db.BusquedaInquilinoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.insta = db.BusquedaInstalacionProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            return View();
        }
        [HttpPost]
        public ActionResult Index(Models.EventoTable evento)
        {
            db.EventoTables.InsertOnSubmit(evento);
            db.SubmitChanges();

            return RedirectToAction("Index", "Evento");
        }


        public JsonResult GetEvents()
        {
            Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();

            int IdPersona = (int)Session["PersonaId"];
            int IdTipoPersona = (int)Session["PersonaTipoId"];
            int IdCondominio = (int)Session["CondominioId"];

            var v = db.BusquedaEventoProc(IdPersona, IdTipoPersona, IdCondominio).ToList().Select(x=>new { start =  x.EventoFechaInicial.ToString("yyyy-MM-ddThh:mm"), end = x.EventoFechaFinal.ToString("yyyy-MM-ddThh:mm"), title=x.EventoDescripcion}) ;
                return Json(v, JsonRequestBehavior.AllowGet);
            
            
               
            
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


    }
}