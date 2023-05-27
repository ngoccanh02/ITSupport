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
    }
}