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
    public class TopicController : Controller
    {
        ITSupportEntities data = new ITSupportEntities();
        // GET: Admin/Course
        public ActionResult Index(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 7;
            return View(data.Topic.ToList().OrderBy(n => n.IDTopic).ToPagedList(iPageNum, iPageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.IDCreator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Topic topic, FormCollection f, HttpPostedFileBase fFileUpload)
        {
            ViewBag.IDCreator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role");

            if (fFileUpload == null)
            {
                ViewBag.ThongBao = "Hay chon anh bia";
                ViewBag.TenSach = f["sTenSach"];
                ViewBag.MoTa = f["sMoTa"];
                ViewBag.IDCreator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role", int.Parse(f["IDCreator"]));
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Asset/Image/Topic"), sFileName);
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    topic.NameTopic = f["sTenSach"];
                    topic.Describe = f["sMoTa"].Replace("<p>", "").Replace("</p>", "/n");
                    topic.Images = sFileName;
                    topic.CreateDate = Convert.ToDateTime(f["dNgayCapNhat"]);
                    data.Topic.Add(topic);
                    data.SaveChanges();
                }
                return View();
            }
        }

        public ActionResult Details(int id)
        {
            var topic = data.Topic.SingleOrDefault(n => n.IDTopic == id);
            if (topic == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(topic);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var topic = data.Topic.SingleOrDefault(n => n.IDTopic == id);
            if (topic == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(topic);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirm(int id, FormCollection f)
        {
            var topic = data.Topic.SingleOrDefault(n => n.IDTopic == id);
            if (topic == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var acourse = (data.Topic.Where(vs => vs.IDTopic == id)).SingleOrDefault();
            if (acourse != null)
            {
                data.Topic.Remove(acourse);
                data.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var topic = data.Topic.SingleOrDefault(n => n.IDTopic == id);
            if (topic == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.Creator = new SelectList(data.ACourse.ToList().OrderBy(n => n.Role), "IDCreator", "Role", topic.IDCreator);
            return View(topic);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f, HttpPostedFileBase fFileUpload)
        {
            var iMaSach = int.Parse(f["iMaSach"]);
            var topic = data.Topic.SingleOrDefault(n => n.IDTopic == iMaSach);

            if (ModelState.IsValid)
            {
                if (fFileUpload != null)
                {
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Asset/Image/Topic"), sFileName);
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    topic.Images = sFileName;
                }
                topic.NameTopic = f["sTenSach"];
                topic.Describe = f["sMoTa"].Replace("<p>", "").Replace("</p>", "\n");
                topic.ModifiedDate = Convert.ToDateTime(f["dNgaySuaDoi"]);
                data.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(topic);
        }
    }
}