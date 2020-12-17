using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace CondominioHosting.Controllers
{
    public class AccountController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        
        public ActionResult LogOn()
        {
            ViewBag.sexo = db.SexoTables.ToList();
            return RedirectToAction("Index","Home");
        }

        [HttpPost]
        public ActionResult LogOn(Models.PersonaTable persona)
        {
            db.PersonaTables.InsertOnSubmit(persona);
            db.SubmitChanges();

            ViewBag.sexo = db.SexoTables.ToList();
            return View();
        }

        [HttpPost]
        public JsonResult CheckLogin(string PersonaCorreo, string PersonaContra)
        {
            var loginResult = db.PersonaTables.Where(s => s.PersonaCorreo == PersonaCorreo && s.PersonaContra == PersonaContra).FirstOrDefault();
            if (loginResult != null)
            {
                int? condominioId = loginResult.PersonaCondominioId;
                if(condominioId == null)
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
    }
}