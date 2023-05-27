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
    public class LessonController : Controller
    {
        // GET: Lesson
        ITSupportEntities data = new ITSupportEntities();
        public ActionResult Index(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 7;
            return View(data.Lesson.ToList().OrderBy(n => n.IDLesson).ToPagedList(iPageNum, iPageSize));

        }

        public ActionResult IDChương4()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 4)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 4)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương5()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 5)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 5)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương6()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 6)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 6)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương7()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 7)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 7)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương8()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 8)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 8)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương9()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 9)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 9)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương10()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 10)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 10)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương11()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 11)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 11)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương12()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 12)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 12)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương13()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 13)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 13)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương14()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 14)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 14)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương15()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 15)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 15)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương16()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 16)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 16)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương17()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 17)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 17)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương18()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 18)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 18)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương19()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 19)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 19)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương20()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 20)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 20)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương21()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 21)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 21)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương24()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 24)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 24)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương25()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 25)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 25)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }

        public ActionResult IDChương26()
        {
            // Lấy danh sách các Lesson có IDCourse = 4 từ bảng Lesson
            var lessons = data.Lesson
                .Where(l => l.IDCourse == 26)
                .ToList();

            // Lấy tên của Course có ID = 4 từ bảng Course
            var courseName = data.Course.FirstOrDefault(c => c.IDCourse == 26)?.Name;

            // Lưu tên Course vào ViewBag để hiển thị trên view
            ViewBag.CourseName = courseName;

            return View(lessons);
        }
    }
}