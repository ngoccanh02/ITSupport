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
    public class LessonController : Controller
    {
        ITSupportEntities data = new ITSupportEntities();
        // GET: Admin/Lesson
        public ActionResult Index(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 7;
            return View(data.Lesson.ToList().OrderBy(n => n.IDLesson).ToPagedList(iPageNum, iPageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.IDCourse = new SelectList(data.Course.ToList().OrderBy(n => n.Name), "IDCourse", "Name");
            ViewBag.IDCreator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Lesson lesson, FormCollection f, HttpPostedFileBase fFileUpload)
        {
            ViewBag.IDCourse = new SelectList(data.Course.ToList().OrderBy(n => n.Name), "IDCourse", "Name");
            ViewBag.IDCreator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role");

            if (fFileUpload == null)
            {
                ViewBag.ThongBao = "Hay chon anh bia";
                ViewBag.TenSach = f["sTenSach"];
                ViewBag.MoTa = f["sMoTa"];
                ViewBag.IDCourse = new SelectList(data.Course.ToList().OrderBy(n => n.Name), "IDCourse", "Name", int.Parse(f["IDCourse"]));
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
                    lesson.Name = f["sTenSach"];
                    lesson.Describe = f["sMoTa"].Replace("<p>", "").Replace("</p>", "/n");
                    lesson.Images = sFileName;
                    lesson.CreateDate = Convert.ToDateTime(f["dNgayCapNhat"]);
                    lesson.IDCourse = int.Parse(f["IDCourse"]);
                    data.Lesson.Add(lesson);
                    data.SaveChanges();
                }
                return View();
            }
        }

        public ActionResult Details(int id)
        {
            var lesson = data.Lesson.SingleOrDefault(n => n.IDLesson == id);
            if (lesson == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(lesson);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var lesson = data.Lesson.SingleOrDefault(n => n.IDLesson == id);
            if (lesson == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(lesson);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirm(int id, FormCollection f)
        {
            var lesson = data.Lesson.SingleOrDefault(n => n.IDLesson == id);
            if (lesson == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var alesson = (data.Lesson.Where(vs => vs.IDLesson == id)).SingleOrDefault();
            if (alesson != null)
            {
                data.Lesson.Remove(alesson);
                data.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var lesson = data.Lesson.SingleOrDefault(n => n.IDLesson == id);
            if (lesson == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaMH = new SelectList(data.Course.ToList().OrderBy(n => n.Name), "IDCourse", "Name", lesson.IDCourse);
            ViewBag.Creator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role", lesson.IDCreator);
            return View(lesson);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f, HttpPostedFileBase fFileUpload)
        {
            var iMaSach = int.Parse(f["iMaSach"]);
            var lesson = data.Lesson.SingleOrDefault(n => n.IDLesson == iMaSach);
            ViewBag.MaMH = new SelectList(data.Course.ToList().OrderBy(n => n.Name), "IDCourse", "Name", lesson.IDCourse);
            ViewBag.Creator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role", lesson.IDCreator);

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
                    lesson.Images = sFileName;
                }
                lesson.Name = f["sTenSach"];
                lesson.Describe = f["sMoTa"].Replace("<p>", "").Replace("</p>", "\n");
                lesson.ModifiedDate = Convert.ToDateTime(f["dNgaySuaDoi"]);
                lesson.IDCourse = int.Parse(f["MaMH"]);
                data.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lesson);
        }
    }
}