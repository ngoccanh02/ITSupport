using ITSupport.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;

namespace ITSupport.Controllers
{
    public class HomeController : Controller
    {
        ITSupportEntities data = new ITSupportEntities();
        public ActionResult Index(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 4;
            return View(data.Course.ToList().OrderBy(n => n.IDCourse).ToPagedList(iPageNum, iPageSize));
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(FormCollection collection, User kh)
        {
            var sHoTen = collection["Name"];
            var STenDN = collection["UserName"];
            var sMatKhau = collection["Password"];
            var sMatKhauNhapLai = collection["Password"];
            var sDiaChi = collection["Address"];
            var sEmail = collection["Email"];
            var sDienThoai = collection["Phone"];
            if (string.IsNullOrEmpty(sHoTen))
            {
                ViewData["err1"] = "Name cannot be empty";
            }
            else if (string.IsNullOrEmpty(STenDN))
            {
                ViewData["err2"] = "Username cannot be empty";
            }
            else if (string.IsNullOrEmpty(sMatKhau))
            {
                ViewData["err3"] = "Password must be entered";
            }
            else if (string.IsNullOrEmpty(sMatKhauNhapLai))
            {
                ViewData["err4"] = "Password must be re-entered";
            }
            else if (sMatKhau != sMatKhauNhapLai)
            {
                ViewData["err4"] = "Re-entered password does not match";
            }
            else if (string.IsNullOrEmpty(sEmail))
            {
                ViewData["err5"] = "Email cannot be empty";
            }
            else if (string.IsNullOrEmpty(sDienThoai))
            {
                ViewData["err6"] = "Phone number cannot be empty";
            }
            else if (data.User.SingleOrDefault(n => n.UserName == STenDN) != null)
            {
                ViewBag.ThongBao = "Username available";
            }
            else if (data.User.SingleOrDefault(n => n.Email == sEmail) != null)
            {
                ViewBag.ThongBao = "Email already in use";
            }
            else
            {
                kh.Name = sHoTen;
                kh.UserName = STenDN;
                kh.Password = sMatKhau;
                kh.Email = sEmail;
                kh.Address = sDiaChi;
                kh.Phone = sDienThoai;
                //db.KHACHHANGs.add(kh);
                //db.SaveChanges();
                return RedirectToAction("Login");

            }
            return this.Register();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection f)
        {

            var sTenDN = f["UserName"];
            var sMatKhau = f["Password"];
            User ad = data.User.SingleOrDefault(n => n.UserName == sTenDN && n.Password == sMatKhau);
            if (ad != null)
            {
                Session["User"] = ad;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.ThongBao = "Tài khoản hoặc mật khẩu không đúng";
            }
            return View();
        }

    }
}