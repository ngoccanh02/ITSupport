using ITSupport.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using PagedList;

namespace ITSupport.Controllers
{
    public class CourseController : Controller
    {
        // GET: Course
        ITSupportEntities data = new ITSupportEntities();
        public ActionResult Index(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 4;
            return View(data.Topic.ToList().OrderBy(n => n.IDTopic).ToPagedList(iPageNum, iPageSize));

        }

        public ActionResult Excel()
        {
            // Lấy danh sách tất cả các chương từ bảng Course
            var chapters = data.Course.ToList();

            // Lọc danh sách các chương có khóa học tương ứng với Excel
            var excelChapters = chapters.Where(c => c.IDTopic == 3).ToList();

            // Lấy tên của chủ đề Excel từ bảng Topic
            var topic = data.Topic.FirstOrDefault(t => t.IDTopic == 3);

            // Truyền tên chủ đề vào Model để hiển thị trên View
            ViewBag.TopicName = topic.NameTopic;

            return View(excelChapters);
        }

        public ActionResult Word()
        {
            // Lấy danh sách tất cả các chương từ bảng Course
            var chapters = data.Course.ToList();

            // Lọc danh sách các chương có khóa học tương ứng với Excel
            var excelChapters = chapters.Where(c => c.IDTopic == 1).ToList();

            // Lấy tên của chủ đề Excel từ bảng Topic
            var topic = data.Topic.FirstOrDefault(t => t.IDTopic == 1);

            // Truyền tên chủ đề vào Model để hiển thị trên View
            ViewBag.TopicName = topic.NameTopic;

            return View(excelChapters);
        }

        public ActionResult PowerPoint()
        {
            // Lấy danh sách tất cả các chương từ bảng Course
            var chapters = data.Course.ToList();

            // Lọc danh sách các chương có khóa học tương ứng với Excel
            var excelChapters = chapters.Where(c => c.IDTopic == 6).ToList();

            // Lấy tên của chủ đề Excel từ bảng Topic
            var topic = data.Topic.FirstOrDefault(t => t.IDTopic == 6);

            // Truyền tên chủ đề vào Model để hiển thị trên View
            ViewBag.TopicName = topic.NameTopic;

            return View(excelChapters);
        }

    }
}