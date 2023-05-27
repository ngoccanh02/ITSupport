using ITSupport.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using Microsoft.Owin.Security;
using System.Security.Claims;
using System.Web.ApplicationServices;

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
            Models.Admin user = data.Admin.SingleOrDefault(n => n.Email == sTenDN && n.Password == sMatKhau);
            if (user != null)
            {
                Session.Timeout = 24 * 60;
                Session["Admin"] = user;
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