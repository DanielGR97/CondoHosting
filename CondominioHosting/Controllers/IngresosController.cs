using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class IngresosController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Ingresos
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
            ViewBag.listado = db.BusquedaIngresoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.condominio = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.tipoIngreso = db.BusquedaTipoIngresoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.IngresoTable ingresos)
        {
            db.IngresoTables.InsertOnSubmit(ingresos);
            db.SubmitChanges();

            return RedirectToAction("Index", "Ingresos");
        }

        [HttpPost]
        public ActionResult Deshacer(int Id)
        {
            var t = db.IngresoTables.Where(x => x.IngresoId == Id).FirstOrDefault();
            t.IngresoActivo = false;
            db.SubmitChanges();

            return RedirectToAction("Index", "Ingresos");
        }

        public ActionResult ObtenerDatos(int Id)
        {
            var t = db.IngresoTables.Where(x => x.IngresoId == Id).FirstOrDefault();

            return new JsonResult
            {
                Data = new
                {
                    descripcion = t.IngresoDescripcion,
                    tipo = t.IngresoTipoIngresoId,
                    fecha = t.IngresoFecha.ToString("yyyy-MM-dd"),
                    costo = t.IngresoCantidad
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, string descripcion, int tipo, DateTime fecha, decimal costo)
        {
            var t = db.IngresoTables.Where(x => x.IngresoId == Id).FirstOrDefault();
            t.IngresoDescripcion = descripcion;
            t.IngresoTipoIngresoId = tipo;
            t.IngresoFecha = fecha;
            t.IngresoCantidad = costo;
            db.SubmitChanges();

            return RedirectToAction("Index", "Ingresos");
        }

        public ActionResult CambiarCombo(int condominio)
        {
            var comboList = db.TipoIngresoTables.Where(s => s.CondominioId.Equals(condominio) && s.TipoIngresoActivo==true)
                .Select(a => new
                {
                    TipoIngresoId = a.TipoIngresoId,
                    TipoIngresoDescripcion = a.TipoIngresoDescripcion
                });
            //ViewBag.tipoIngreso = comboList;

            return Json(comboList,  JsonRequestBehavior.AllowGet);

        }

    }
}