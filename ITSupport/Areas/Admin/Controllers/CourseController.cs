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
    public class CourseController : Controller
    {
        ITSupportEntities data = new ITSupportEntities();
        // GET: Admin/Course
        public ActionResult Index(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 7;
            return View(data.Course.ToList().OrderBy(n => n.IDCourse).ToPagedList(iPageNum, iPageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.IDTopic = new SelectList(data.Topic.ToList().OrderBy(n => n.NameTopic), "IDTopic", "NameTopic");
            ViewBag.IDPH = new SelectList(data.PublishingHouse.ToList().OrderBy(n => n.NamePH), "IDPH", "NamePH");
            ViewBag.IDCreator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Course course, FormCollection f, HttpPostedFileBase fFileUpload)
        {
            ViewBag.IDTopic = new SelectList(data.Topic.ToList().OrderBy(n => n.NameTopic), "IDTopic", "NameTopic");
            ViewBag.IDPH = new SelectList(data.PublishingHouse.ToList().OrderBy(n => n.NamePH), "IDPH", "NamePH");
            ViewBag.IDCreator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role");

            if (fFileUpload == null)
            {
                ViewBag.ThongBao = "Hay chon anh bia";
                ViewBag.TenSach = f["sTenSach"];
                ViewBag.MoTa = f["sMoTa"];
                ViewBag.IDTopic = new SelectList(data.Topic.ToList().OrderBy(n => n.NameTopic), "IDTopic", "NameTopic", int.Parse(f["IDTopic"]));
                ViewBag.IDPH = new SelectList(data.PublishingHouse.ToList().OrderBy(n => n.NamePH), "IDPH", "NamePH", int.Parse(f["IDPH"]));
                ViewBag.IDCreator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role", int.Parse(f["IDCreator"]));
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Asset/Image"), sFileName);
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    course.Name = f["sTenSach"];
                    course.Describe = f["sMoTa"].Replace("<p>", "").Replace("</p>", "/n");
                    course.Images = sFileName;
                    course.CreateDate = Convert.ToDateTime(f["dNgayCapNhat"]);
                    course.IDTopic = int.Parse(f["IDTopic"]);
                    course.IDPH = int.Parse(f["IDPH"]);
                    data.Course.Add(course);
                    data.SaveChanges();
                }
                return View();
            }
        }

        public ActionResult Details(int id)
        {
            var course = data.Course.SingleOrDefault(n => n.IDCourse == id);
            if (course == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(course);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var course = data.Course.SingleOrDefault(n => n.IDCourse == id);
            if (course == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(course);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirm(int id, FormCollection f)
        {
            var course = data.Course.SingleOrDefault(n => n.IDCourse == id);
            if (course == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var acourse = (data.Course.Where(vs => vs.IDCourse == id)).SingleOrDefault();
            if (acourse != null)
            {
                data.Course.Remove(acourse);
                data.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var course = data.Course.SingleOrDefault(n => n.IDCourse == id);
            if (course == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaCD = new SelectList(data.Topic.ToList().OrderBy(n => n.NameTopic), "IDTopic", "NameTopic", course.IDTopic);
            ViewBag.MaNXB = new SelectList(data.PublishingHouse.ToList().OrderBy(n => n.NamePH), "IDPH", "NamePH", course.IDPH);
            ViewBag.Creator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role", course.IDCreator);
            return View(course);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f, HttpPostedFileBase fFileUpload)
        {
            var iMaSach = int.Parse(f["iMaSach"]);
            var course = data.Course.SingleOrDefault(n => n.IDCourse == iMaSach);
            ViewBag.MaCD = new SelectList(data.Topic.ToList().OrderBy(n => n.NameTopic), "IDTopic", "NameTopic", course.IDTopic);
            ViewBag.MaNXB = new SelectList(data.PublishingHouse.ToList().OrderBy(n => n.NamePH), "IDPH", "NamePH", course.IDPH);
            ViewBag.Creator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role", course.IDCreator);

            if (ModelState.IsValid)
            {
                if (fFileUpload != null)
                {
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Asset/Image"), sFileName);
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    course.Images = sFileName;
                }
                course.Name = f["sTenSach"];
                course.Describe = f["sMoTa"].Replace("<p>", "").Replace("</p>", "\n");
                course.ModifiedDate = Convert.ToDateTime(f["dNgaySuaDoi"]);
                course.IDTopic = int.Parse(f["MaCD"]);
                course.IDPH = int.Parse(f["MaNXB"]);
                data.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(course);
        }
    }
}