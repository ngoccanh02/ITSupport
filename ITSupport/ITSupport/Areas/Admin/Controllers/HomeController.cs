using ITSupport.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using ITSupport.Models;
namespace ITSupport.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        ITSupportEntities data = new ITSupportEntities();
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection h)
        {

            var sTenDN = h["Email"];
            var sMatKhau = h["Password"];
           ITSupport.Models.Admin ad = data.Admin.SingleOrDefault(n => n.Email == sTenDN && n.Password == sMatKhau);
            if (ad != null)
            {
                Session["Admin"] = ad;
                return RedirectToAction("Index", "Course");
            }
            else
            {
                ViewBag.ThongBao = "Tài khoản hoặc mật khẩu không đúng";
            }
            return View();
        }
    }
}