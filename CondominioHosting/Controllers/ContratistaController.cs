using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class ContratistaController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Contratista
        [Authorize(Roles = "Admin,Contratistas")]
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
            ViewBag.condominio = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.listado = db.BusquedaContratistaProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.servicio = db.ServicioContratistaTables.ToList();
            ViewBag.sexo = db.SexoTables.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Index(Models.PersonaTable persona)
        {
            db.PersonaTables.InsertOnSubmit(persona);
            db.SubmitChanges();

            return RedirectToAction("Index", "Contratista");
        }

        [HttpPost]
        public ActionResult Deshacer(int Id)
        {
            var t = db.PersonaTables.Where(x => x.PersonaId == Id).FirstOrDefault();
            t.PersonaActivo = false;
            db.SubmitChanges();

            return RedirectToAction("Index", "Contratista");
        }


        public ActionResult ObtenerDatos(int Id)
        {
            var t = db.PersonaTables.Where(x => x.PersonaId == Id).FirstOrDefault();

            return new JsonResult
            {
                Data = new
                {
                    nombre = t.PersonaNombre,
                    apellido = t.PersonaApellido,
                    sexo = t.PersonaSexoId,
                    telefono = t.PersonaTelefono,
                    documento = t.PersonaDocumento,
                    direccion = t.PersonaDireccion,
                    compa = t.PersonaCompañia,
                    rnc = t.PersonaRNC,
                    servicio = t.PersonaServicio
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, string nombre, string apellido, byte sexo, string telefono, string documento, string direccion, string compa, string rnc, int servicio)
        {
            var t = db.PersonaTables.Where(x => x.PersonaId == Id).FirstOrDefault();
            t.PersonaNombre = nombre;
            t.PersonaApellido = apellido;
            t.PersonaSexoId = sexo;
            t.PersonaTelefono = telefono;
            t.PersonaDocumento = documento;
            t.PersonaDireccion = direccion;
            t.PersonaCompañia = compa;
            t.PersonaRNC = rnc;
            t.PersonaServicio = servicio;
            db.SubmitChanges();

            return RedirectToAction("Index", "Contratista");
        }
    }
}