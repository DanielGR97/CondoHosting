using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class RolController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Rol
        [Authorize(Roles = "Admin")]
        public ActionResult Index()
        {
            string NombrePersona = (string)Session["PersonaNombre"];
            string CondominioPersona = (string)Session["PersonaCondominio"];
            int IdPersona = (int)Session["PersonaId"];

            ViewBag.UsuarioNombre = NombrePersona;
            ViewBag.CondominioNombre = CondominioPersona;
            ViewBag.rol = db.BusquedaRolProc(IdPersona).ToList();
            ViewBag.condominio = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.acceso = db.AccesoTables.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.RolTable roles)
        {
            db.RolTables.InsertOnSubmit(roles);
            db.SubmitChanges();

            return RedirectToAction("Index", "Rol");
        }

        public ActionResult ObtenerDatos(int Id)
        {
            var t = db.RolTables.Where(x => x.RolId == Id).FirstOrDefault();

            return new JsonResult { Data = t.Descripcion,JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }

        public ActionResult ObtenerDatos2(int Id)
        {
            var comboList = db.DetalleRolTables.Where(s => s.RolId.Equals(Id))
                .Select(a => new
                {
                    DetalleRolId = a.DetalleRolId,
                    AccesNombre = a.AccesoTable.AccesNombre
                });

            return Json(comboList, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Modificar(int Id, string descripcion)
        {
            var t = db.RolTables.Where(x => x.RolId == Id).FirstOrDefault();
            t.Descripcion = descripcion;
            db.SubmitChanges();

            return RedirectToAction("Index", "Rol");
        }

        public ActionResult CambiarCombo()
        {
            var comboList = db.AccesoTables.Where(s => ! s.AccesNombre.Equals("Admin"))
                .Select(a => new
                {
                    AccesoId = a.AccesoId,
                    AccesNombre = a.AccesNombre
                });
            //ViewBag.tipoIngreso = comboList;

            return Json(comboList, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        public ActionResult AgregarDetalle(int Id, int IdAcceso)
        {
            if(db.DetalleRolTables.Any(u => u.RolId == Id && u.AccesoId == IdAcceso))
            {
                return Json(new { success = false}, JsonRequestBehavior.AllowGet);
            }
            else
            {
                CondominioHosting.Models.DetalleRolTable data = new CondominioHosting.Models.DetalleRolTable
                {
                    RolId = Id,
                    AccesoId = IdAcceso
                };

                db.DetalleRolTables.InsertOnSubmit(data);
                db.SubmitChanges();

                return Json(new { success = true, DetalleRolId = data.DetalleRolId }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult EliminarDetalle(int Id)
        {
            var t = db.DetalleRolTables.Where(x => x.DetalleRolId == Id).FirstOrDefault();
            db.DetalleRolTables.DeleteOnSubmit(t);
            db.SubmitChanges();

            return new JsonResult { Data = "hola", JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
    }
}