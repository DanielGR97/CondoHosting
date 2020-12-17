using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class EmpleadoController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: Empleado
        [Authorize(Roles = "Admin,Empleados")]
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
            ViewBag.listado = db.BusquedaEmpleadoProc(IdPersona,IdTipoPersona,IdCondominio) .ToList();
            ViewBag.condominio = db.BusquedaCondominioProc(IdPersona).ToList();
            ViewBag.rol = db.BusquedaRolEmProc(IdPersona,IdTipoPersona,IdCondominio) .ToList();
            ViewBag.sexo = db.SexoTables.ToList();
            ViewBag.nacion = db.NacionalidadTables.ToList();
            return View();
        }


        [HttpPost]
        public ActionResult Index(Models.PersonaTable persona)
        {
            db.PersonaTables.InsertOnSubmit(persona);
            db.SubmitChanges();

            return RedirectToAction("Index", "Empleado");
        }

        [HttpPost]
        public ActionResult Deshacer(int Id)
        {
            var t = db.PersonaTables.Where(x => x.PersonaId == Id).FirstOrDefault();
            t.PersonaActivo= false;
            db.SubmitChanges();

            return RedirectToAction("Index", "Empleado");
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
                    sueldo = t.PersonaSueldo,
                    nacionalidad = t.PersonaNacionalidad,
                    direccion = t.PersonaDireccion,
                    rol = t.PersonaRolId
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }

        [HttpPost]
        public ActionResult Modificar(int Id, string nombre, string apellido, DateTime nacimiento ,byte sexo, string documento, string telefono, decimal sueldo, int nacionalidad ,string direccion, int rol)
        {
            var t = db.PersonaTables.Where(x => x.PersonaId == Id).FirstOrDefault();
            t.PersonaNombre = nombre;
            t.PersonaApellido = apellido;
            t.PersonaFechaNacimiento = nacimiento;
            t.PersonaSexoId = sexo;
            t.PersonaDocumento = documento;
            t.PersonaTelefono = telefono;
            t.PersonaSueldo = sueldo;
            t.PersonaNacionalidad = nacionalidad;
            t.PersonaDireccion = direccion;
            t.PersonaRolId = rol;
            db.SubmitChanges();

            return RedirectToAction("Index", "Empleado");
        }

        public ActionResult CambiarCombo(int condominio)
        {
            var comboList = db.RolTables.Where(s => s.CondominioId.Equals(condominio))
                .Select(a => new
                {
                    RolId = a.RolId,
                    Descripcion = a.Descripcion
                });
            //ViewBag.tipoIngreso = comboList;

            return Json(comboList, JsonRequestBehavior.AllowGet);

        }
    }
}