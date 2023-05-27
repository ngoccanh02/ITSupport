using ITSupport.Models;
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

namespace ITSupport.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        ITSupportEntities data = new ITSupportEntities();
        // GET: Admin/Course
        public ActionResult Index(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 7;
            return View(data.Admin.ToList().OrderBy(n => n.IDAdmin).ToPagedList(iPageNum, iPageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(ITSupport.Models.Admin admin, FormCollection f, HttpPostedFileBase fFileUpload)
        {
            if (fFileUpload == null)
            {
                ViewBag.ThongBao = "Hãy chọn ảnh đại diện";
                ViewBag.pass = "Vui lòng nhập mật khẩu";
                ViewBag.TenAdmin = f["sName"];
                ViewBag.EmailAdmin = f["sEmail"];
                ViewBag.passAdmin = f["spass"];

                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Asset/Image/Admin"), sFileName);
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    admin.Name = f["sName"];
                    admin.Email = f["sEmail"];
                    admin.Password = f["spass"];
                    admin.Images = sFileName;
                    admin.CreateDate = Convert.ToDateTime(f["dNgayCapNhat"]);
                    data.Admin.Add(admin);
                    data.SaveChanges();
                }
                return View();
            }
        }

        public ActionResult Details(int id)
        {
            var admin = data.Admin.SingleOrDefault(n => n.IDAdmin == id);
            if (admin == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(admin);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var admin = data.Admin.SingleOrDefault(n => n.IDAdmin == id);
            if (admin == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(admin);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirm(int id, FormCollection f)
        {
            var admin = data.Admin.SingleOrDefault(n => n.IDAdmin == id);
            if (admin == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var acourse = (data.Admin.Where(vs => vs.IDAdmin == id)).SingleOrDefault();
            if (acourse != null)
            {
                data.Admin.Remove(acourse);
                data.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var admin = data.Admin.SingleOrDefault(n => n.IDAdmin == id);
            if (admin == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(admin);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f, HttpPostedFileBase fFileUpload)
        {
            var iMaAdmin = int.Parse(f["iMaAdmin"]);
            var admin = data.Admin.SingleOrDefault(n => n.IDAdmin == iMaAdmin);

            if (ModelState.IsValid)
            {
                if (fFileUpload != null)
                {
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Asset/Image/Admin"), sFileName);
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    admin.Images = sFileName;
                }
                admin.Name = f["sName"];
                admin.Email = f["sEmail"];
                admin.Password = f["spass"];
                admin.ModifiedDate = Convert.ToDateTime(f["dNgaySuaDoi"]);
                data.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(admin);
        }
    }
}