using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class InquilinosController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Inquilinos
        [Authorize(Roles = "Admin,Inquilino")]
        public ActionResult Index()
        {
            string NombrePersona = (string)Session["PersonaNombre"];
            string CondominioPersona = (string)Session["PersonaCondominio"];
            int IdPersona = (int)Session["PersonaId"];
            int IdTipoPersona = (int)Session["PersonaTipoId"];
            int IdCondominio = (int)Session["CondominioId"];

            ViewBag.UsuarioNombre = NombrePersona;
            ViewBag.CondominioNombre = CondominioPersona;
            ViewBag.listado = db.BusquedaInquilinoProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.condominio = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.sexo = db.SexoTables.ToList();
            ViewBag.referido = db.ComboBoxReferidosProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.civil = db.EstadoCivilTables.ToList();
            ViewBag.nacion = db.NacionalidadTables.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Deshacer(int Id)
        {
            var t = db.PersonaTables.Where(x => x.PersonaId == Id).FirstOrDefault();
            t.PersonaActivo = false;
            db.SubmitChanges();

            return RedirectToAction("Index", "Inquilinos");
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
                    nacimiento = t.PersonaFechaNacimiento,
                    sexo = t.PersonaSexoId,
                    documento = t.PersonaDocumento,
                    telefono = t.PersonaTelefono,
                    nacionalidad = t.PersonaNacionalidad,
                    direccion = t.PersonaDireccion
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, string nombre, string apellido, DateTime nacimiento, byte sexo, string documento, string telefono, int nacionalidad, string direccion)
        {
            var t = db.PersonaTables.Where(x => x.PersonaId == Id).FirstOrDefault();
            t.PersonaNombre = nombre;
            t.PersonaApellido = apellido;
            t.PersonaFechaNacimiento = nacimiento;
            t.PersonaSexoId = sexo;
            t.PersonaDocumento = documento;
            t.PersonaTelefono = telefono;
            t.PersonaNacionalidad = nacionalidad;
            t.PersonaDireccion = direccion;
            db.SubmitChanges();

            return RedirectToAction("Index", "Inquilinos");
        }


        public ActionResult RegistroPropiedadServicios()
        {
            return View();
        }
        
        public ActionResult RegistrarInquilino()
        {
            string NombrePersona = (string)Session["PersonaNombre"];
            string CondominioPersona = (string)Session["PersonaCondominio"];
            int IdPersona = (int)Session["PersonaId"];
            int IdTipoPersona = (int)Session["PersonaTipoId"];
            int IdCondominio = (int)Session["CondominioId"];

            ViewBag.UsuarioNombre = NombrePersona;
            ViewBag.CondominioNombre = CondominioPersona;
            ViewBag.CondominioId = IdCondominio;
            ViewBag.condominios = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.referido = db.ComboBoxReferidosProc(IdPersona, IdTipoPersona, IdCondominio).ToList();
            ViewBag.civil = db.EstadoCivilTables.ToList();
            ViewBag.listado = db.PersonaTables.ToList();
            ViewBag.sex = db.SexoTables.ToList();
            ViewBag.nac = db.NacionalidadTables.ToList();
            return View();
        }
        [HttpPost]
        public ActionResult RegistrarInquilino(Models.PersonaTable persona)
        {
            db.PersonaTables.InsertOnSubmit(persona);
            db.SubmitChanges();

            string NombrePersona = (string)Session["PersonaNombre"];
            string CondominioPersona = (string)Session["PersonaCondominio"];
            int IdPersona = (int)Session["PersonaId"];
            int IdTipoPersona = (int)Session["PersonaTipoId"];
            int IdCondominio = (int)Session["CondominioId"];

            ViewBag.UsuarioNombre = NombrePersona;
            ViewBag.CondominioNombre = CondominioPersona;
            ViewBag.CondominioId = IdCondominio;
            ViewBag.condominios = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.listado = db.PersonaTables.ToList();
            ViewBag.sex = db.SexoTables.ToList();
            ViewBag.nac = db.NacionalidadTables.ToList();
            return RedirectToAction("Index", "Inquilinos");
        }

    }
}