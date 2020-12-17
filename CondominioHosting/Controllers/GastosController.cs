using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class GastosController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Gastos
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
            ViewBag.listado = db.BusquedaGastoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.condominio = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.tipoGasto = db.BusquedaTipoGastoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.GastoTable gastos)
        {
            db.GastoTables.InsertOnSubmit(gastos);
            db.SubmitChanges();

            return RedirectToAction("Index", "Gastos");
        }

        [HttpPost]
        public ActionResult Deshacer(int Id)
        {
            var t = db.GastoTables.Where(x => x.GastoId == Id).FirstOrDefault();
            t.GastoActivo = false;
            db.SubmitChanges();

            return RedirectToAction("Index", "Gastos");
        }

        public ActionResult ObtenerDatos(int Id)
        {
            var t = db.GastoTables.Where(x => x.GastoId == Id).FirstOrDefault();

            return new JsonResult
            {
                Data = new
                {
                    descripcion = t.GastoDescripcion,
                    tipo = t.GastoTipoGastoId,
                    fecha = t.GastoFecha.ToString("yyyy-MM-dd"),
                    costo = t.GastoCantidad
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, string descripcion, int tipo, DateTime fecha, decimal costo)
        {
            var t = db.GastoTables.Where(x => x.GastoId == Id).FirstOrDefault();
            t.GastoDescripcion = descripcion;
            t.GastoTipoGastoId = tipo;
            t.GastoFecha = fecha;
            t.GastoCantidad = costo;
            db.SubmitChanges();

            return RedirectToAction("Index", "Gastos");
        }

        public ActionResult CambiarCombo(int condominio)
        {
            var comboList = db.TipoGastoTables.Where(s => s.CondominioId.Equals(condominio) && s.TipoGastoActivo == true)
                .Select(a => new
                {
                    TipoGastoId = a.TipoGastoId,
                    TipoGastoDescripcion = a.TipoGastoDescripcion
                });
            //ViewBag.tipoIngreso = comboList;

            return Json(comboList, JsonRequestBehavior.AllowGet);

        }
    }
}