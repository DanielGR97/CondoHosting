using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CondominioHosting.Controllers
{
    public class BuscarInquilinoController : Controller
    {
        Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext();
        // GET: BuscarInquilino
        public ActionResult Index()
        {
            
            return View();
        }
    }
}