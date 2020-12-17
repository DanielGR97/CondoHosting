using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace CondominioHosting.Controllers
{
	public class HomeController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();

        
        public ActionResult Index()
        {
            ViewBag.sexo = db.SexoTables.ToList();
            ViewBag.nac = db.NacionalidadTables.ToList();

            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.PersonaTable persona)
        {
            db.PersonaTables.InsertOnSubmit(persona);
            db.SubmitChanges();

            ViewBag.sexo = db.SexoTables.ToList();
            ViewBag.nac = db.NacionalidadTables.ToList();
            return View();
        }

        [HttpPost]
        public JsonResult CheckLogin(string PersonaCorreo, string PersonaContra)
        {
            var loginResult = db.PersonaTables.Where(s => s.PersonaCorreo == PersonaCorreo && s.PersonaContra == PersonaContra).FirstOrDefault();
            if (loginResult != null)
            {
                int? condominioId = loginResult.PersonaCondominioId;
                if (condominioId == null)
                {
                    FormsAuthentication.SetAuthCookie(PersonaCorreo, false);
                    Session["PersonaId"] = loginResult.PersonaId;
                    Session["PersonaNombre"] = loginResult.PersonaNombre;
                    Session["PersonaTipoId"] = loginResult.PersonaTipoId;
                    Session["PersonaCondominio"] = "";
                    Session["CondominioId"] = 0;
                    return Json(loginResult.PersonaNombre, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    var condominioResult = db.CondominioTables.Where(x => x.CondominioId == loginResult.PersonaCondominioId).FirstOrDefault();

                    
                    FormsAuthentication.SetAuthCookie(PersonaCorreo, false);
                    Session["PersonaId"] = loginResult.PersonaId;
                    Session["PersonaNombre"] = loginResult.PersonaNombre;
                    Session["PersonaTipoId"] = loginResult.PersonaTipoId;
                    Session["PersonaCondominio"] = condominioResult.CondominioNombre;
                    Session["CondominioId"] = condominioResult.CondominioId;
                    return Json(loginResult.PersonaNombre, JsonRequestBehavior.AllowGet);
                }

            }
            return Json("InvalidData", JsonRequestBehavior.AllowGet);


            //if (new Models.Security.MembreshipPro().ValidateUser(PersonaCorreo, PersonaContra))

        }


        public ActionResult Menu()
        {
            string NombrePersona = (string)Session["PersonaNombre"];
            string CondominioPersona = (string)Session["PersonaCondominio"];
            int IdPersona = (int)Session["PersonaId"];
            int IdTipoPersona = (int)Session["PersonaTipoId"];
            int IdCondominio = (int)Session["CondominioId"];

            ViewBag.UsuarioNombre = NombrePersona;
            ViewBag.CondominioNombre = CondominioPersona;
            ViewBag.gastos = db.BusquedaGastoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.ingresos = db.BusquedaIngresoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.reclamaciones = db.BusquedaReclamacionProc(IdPersona, IdTipoPersona, IdCondominio).ToList();

            return View();
        }

        public ActionResult Reporte()
        {
            string NombrePersona = (string)Session["PersonaNombre"];
            string CondominioPersona = (string)Session["PersonaCondominio"];
            int IdCondominio = (int)Session["CondominioId"];
            int IdPersona = (int)Session["PersonaId"];

            ViewBag.UsuarioNombre = NombrePersona;
            ViewBag.CondominioNombre = CondominioPersona;
            ViewBag.condominio = db.BusquedaCondominioProc(IdPersona).ToList();

            return View();
        }

        public ActionResult CambiarCombo(int condominio)
        {
            Session["CondominioId"] = condominio;
            return Json("hola", JsonRequestBehavior.AllowGet);
        }
    }
}