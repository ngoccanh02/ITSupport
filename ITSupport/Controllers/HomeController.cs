using ITSupport.Models;
using ITSupport.common;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using System.Data.Entity;
using System.Security.Principal;

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
            var sEmail = collection["Email"];
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
            else if (string.IsNullOrEmpty(sEmail))
            {
                ViewData["err5"] = "Email cannot be empty";
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
                data.User.Add(kh);
                data.SaveChanges();
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
                Session.Timeout = 24 * 60;
                Session["User"] = ad;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.ThongBao = "Tài khoản hoặc mật khẩu không đúng";
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session.Abandon(); // hủy bỏ phiên đăng nhập
            return RedirectToAction("Login"); // chuyển hướng đến trang đăng nhập
        }

        private static Random random = new Random();
        public static string RandomString()
        {
            int length = 8;
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        [HttpGet]
        public ActionResult Forgotpassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Forgotpassword(FormCollection f)
        {
            string email = f["email"];
            User tk = data.User.FirstOrDefault(m => m.Email == email);
            if (tk == null)
            {
                ViewBag.ThongBao = "Email không phù hợp.Vui lòng nhập lại hoặc tạo tài khoản mới";
                return this.Forgotpassword();
            }
            string content = System.IO.File.ReadAllText(Server.MapPath("~/Content/template/changpass.html"));
            content = content.Replace("{{CustomerName}}", tk.Name);
            content = content.Replace("{{Email}}", tk.Email);
            content = content.Replace("{{Date}}", DateTime.Now.ToString("MM/dd/yyyy"));
            var random = RandomString();
            Session["reset"] = random;
            var noidung = "https://localhost:44336/Home/Reset?id=" + random + "&ms=" + tk.ID;
            content = content.Replace("{{Link}}", noidung.ToString());

            // Để Gmail cho phép SmtpClient kết nối đến server SMTP của nó với xác thực 
            //là tài khoản gmail của bạn, bạn cần thiết lập tài khoản email của bạn như sau:
            //Vào địa chỉ https://myaccount.google.com/security  Ở menu trái chọn mục Bảo mật, sau đó tại mục Quyền truy cập 
            //của ứng dụng kém an toàn phải ở chế độ bật
            //  Đồng thời tài khoản Gmail cũng cần bật IMAP
            //Truy cập địa chỉ https://mail.google.com/mail/#settings/fwdandpop

            new MailHelper().SendMail(tk.Email, "Đặt lại mật khẩu", content);
            ViewBag.ThongBao = "Vui lòng kiểm tra Email của bạn";
            return this.Login();
        }

        [HttpGet]
        public ActionResult Reset()
        {
            if ((Request.QueryString["id"]) != Session["reset"].ToString())
            {
                return RedirectToAction("Index", "Home");
            }
            int ms = int.Parse(Request.QueryString["ms"]);
            User find = data.User.Single(m => m.ID == ms);
            return View(find);
        }
        [HttpPost]
        public ActionResult Reset(FormCollection f)
        {
            int mus = Convert.ToInt32(f["iduser"]);
            User ac = data.User.First(n => n.ID == mus);
            if (f["newpass"] != f["enterpass"])
            {
                ViewBag.ThongBao = "Mật khẩu không trùng khớp";
                return View();
            }
            else
            {
                ac.Password = f["newpass"];
                data.SaveChanges();
                Session["reset"] = null;
                return RedirectToAction("Login", "Home");
            }
        }

        [HttpGet]
        public ActionResult Exercise()
        {
            var courses = data.Course
                .Where(c => c.CourseQuestion.Any())
                .Include(c => c.CourseQuestion.Select(q => q.Question.Answer)).ToList();
            courses.ForEach(c =>
            {
                foreach (var question in c.CourseQuestion)
                {
                    foreach (var answer in question.Question.Answer)
                    {
                        answer.IsCorrect = false;
                    }
                }
            });
            return View(courses);
        }

        [HttpGet]
        public ActionResult CourseTest(long id)
        {
            data.Configuration.LazyLoadingEnabled = false;
            var course = data.Course.Find(id);
            if (course == null) return RedirectToAction(nameof(Exercise));
            var user = (User)Session["User"];
            if (user == null) return RedirectToAction(nameof(Login));
            var session = new TestSession
            {
                CourseId = course.IDCourse,
                UserId = user.ID,
                StartTime = DateTimeOffset.Now
            };
            data.TestSession.Add(session);
            data.SaveChanges();
            var questions = data.CourseQuestion
                .AsNoTracking()
                .OrderBy(q => q.Order)
                .Where(q => q.CourseId == id)
                .Include(q => q.Question.Answer)
                .AsEnumerable()
                .Select(q => q.Question)
                .ToList();
            questions.ForEach(q =>
            {
                q.Answer.ToList().ForEach(a => { a.IsCorrect = false; a.Question = null; });
                q.SessionAnswer = null;
                q.CourseQuestion = null;
            });
            ViewBag.Session = session.Id;
            ViewBag.Course = course.Name;
            ViewBag.Time = course.TestTime ?? 0;
            return View(questions);
        }
    }
}