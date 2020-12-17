using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    [Authorize(Roles = "Admin,Presupuestos")]
    public class PresupuestosController : Controller
    {

        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Presupuestos
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
            ViewBag.Listado = db.BusquedaPresupuestoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.condo = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.TipoGastos = db.TipoGastoTables;
            ViewBag.DetallePresupuesto = db.DetallePresupuestoTables.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.PresupuestoTable Presupuesto)
        {
            db.PresupuestoTables.InsertOnSubmit(Presupuesto);
            db.SubmitChanges();

            
            return RedirectToAction("Index", "Presupuestos");

        }

        //[HttpPost]
        //public ActionResult IndexD(Models.DetallePresupuestoTables Presupuesto)
        //{
        //    db.PresupuestoTables.InsertOnSubmit(Presupuesto);
        //    db.SubmitChanges();

        //    ViewBag.Listado = db.PresupuestoTables.ToList();
        //    ViewBag.TipoGastos = db.TipoGastoTables.ToList();
        //    return View();

        //}

        [HttpPost]
        public ActionResult Deshacer(int Id)
        {
            var t = db.PresupuestoTables.Where(x => x.PresupuestoId == Id).FirstOrDefault();
            t.PresupuestoActivo = false;
            db.SubmitChanges();

            ViewBag.listado = db.PresupuestoTables.ToList();
            ViewBag.tipoGasto = db.TipoGastoTables.ToList();
            return View();
        }

        public ActionResult ObtenerDatos(int Id)
        {
            var comboList = db.DetallePresupuestoTables.Where(s => s.PresupuestoId.Equals(Id))
                .Select(a => new
                {
                    DetallePresupuestoId = a.DetallePresupuestoId,
                    DetallePresupuestoCosto = a.DetallePresupuestoCosto,
                    TipoGastoDescripcion = a.TipoGastoTable.TipoGastoDescripcion
                });

            return Json(comboList, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Modificar(int Id, int tipoGasto, decimal costo)
        {
            var t = db.DetallePresupuestoTables.Where(x => x.DetallePresupuestoId == Id).FirstOrDefault();
            t.DetallePresupuestoTipoGastoId = tipoGasto;
            t.DetallePresupuestoCosto = costo;
            db.SubmitChanges();

            ViewBag.Listado = db.DetallePresupuestoTables.ToList();
            ViewBag.tipoGasto = db.TipoGastoTables.ToList();
            return View();
        }

        //public ActionResult CambiarCombo()
        //{
        //    int IdTipoPersona = (int)Session["PersonaTipoId"];
        //    int IdCondominio = (int)Session["CondominioId"];
        //    int IdPersona = (int)Session["PersonaId"];

            //if (IdTipoPersona == 4)
            //{
            //    var comboList = db.BusquedaTipoGastoProc()
            //    .Select(a => new
            //    {
            //        TipoGastoId = a.TipoGastoId,
            //        TipoGastoDescripcion = a.TipoGastoDescripcion
            //    });
            //    return Json(comboList, JsonRequestBehavior.AllowGet);

            //}
            //else
            //{
            //    var comboList = db.TipoGastoTables.Where(s => s.CondominioId.Equals(IdCondominio))
            //    .Select(a => new
            //    {
            //        TipoGastoId = a.TipoGastoId,
            //        TipoGastoDescripcion = a.TipoGastoDescripcion
            //    });
            //    //ViewBag.tipoIngreso = comboList;

        //        return Json(comboList, JsonRequestBehavior.AllowGet);
        //    //}
            

        //}

        public ActionResult AgregarDetalle(int Id, int TipoId, decimal Monto)
        {
            if (db.DetallePresupuestoTables.Any(u => u.PresupuestoId  == Id && u.DetallePresupuestoTipoGastoId == TipoId))
            {
                return Json(new { success = false }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                CondominioHosting.Models.DetallePresupuestoTable data = new CondominioHosting.Models.DetallePresupuestoTable
                {
                    PresupuestoId = Id,
                    DetallePresupuestoTipoGastoId = TipoId,
                    DetallePresupuestoCosto = Monto,
                    DetallePresupuestoActivo = true
                };

                db.DetallePresupuestoTables.InsertOnSubmit(data);
                db.SubmitChanges();

                return Json(new { success = true, DetallePresupuestoId = data.DetallePresupuestoId }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult EliminarDetalle(int Id)
        {
            var t = db.DetallePresupuestoTables.Where(x => x.DetallePresupuestoId == Id).FirstOrDefault();
            db.DetallePresupuestoTables.DeleteOnSubmit(t);
            db.SubmitChanges();

            return new JsonResult { Data = "hola", JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
    }
}