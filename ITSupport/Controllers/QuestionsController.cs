using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using ITSupport.Models;
using System.Linq.Dynamic.Core;
using System.Web.Services;

namespace ITSupport.Controllers
{
    public class QuestionsController : ApiController
    {
        public QuestionsController()
        {
        }
        private ITSupportEntities db = new ITSupportEntities();

        private Admin Admin => (Admin)HttpContext.Current.Session["Admin"];

        // GET: api/Questions
        public IHttpActionResult GetQuestion()
        {
            db.Configuration.LazyLoadingEnabled = false;
            var questions = db.Question.Include(q => q.Answer).AsNoTracking().ToList();
            return Ok(questions);
        }

        [HttpGet]
        [Route("~/api/Questions/Page")]
        public IHttpActionResult Page([FromUri] int pageIndex, [FromUri] int pageSize, [FromUri] string search = null, [FromUri] string[] sort = null)
        {
            if (pageIndex < 1) pageIndex = 1;
            if (pageSize < 1) pageSize = 10;
            db.Configuration.LazyLoadingEnabled = false;
            IQueryable<Question> query = db.Question
                .Include(q => q.Answer).AsNoTracking();
            sort = sort.Where(s => !string.IsNullOrWhiteSpace(s)).ToArray();
            if (sort == null || sort.Length == 0)
            {
                sort = new string[] { $"{nameof(Question.CreateDate)} desc" };
            }
            if (!string.IsNullOrEmpty(search))
                query = query.Where(q => q.Name.Contains(search) || q.Content.Contains(search));
            query = query.OrderBy(string.Join(",", sort));
            var count = query.Count();
            var result = query.Skip(pageIndex * pageSize - pageSize).Take(pageSize).ToList();
            return Ok(new { total = count, items = result });
        }

        // GET: api/Questions/5
        [ResponseType(typeof(Question))]
        public IHttpActionResult GetQuestion(long id)
        {
            Question question = db.Question.Find(id);
            if (question == null)
            {
                return NotFound();
            }

            return Ok(question);
        }

        // PUT: api/Questions/5
        [ResponseType(typeof(void))]
        [WebMethod(EnableSession = true)]
        public IHttpActionResult PutQuestion(long id, Question question)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != question.Id)
            {
                return BadRequest();
            }
            var admin = (Admin)HttpContext.Current.Session["Admin"];
            question.ModifiedBy = admin.IDAdmin.ToString();
            question.ModifiedDate = DateTime.UtcNow;
            var answerKeys = question.Answer.Select(a => a.Id).Where(key => key > 0).ToList();
            var removedAnswer = db.Answer.Where(a => a.QuestionId == id && !answerKeys.Contains(a.Id));
            db.Answer.RemoveRange(removedAnswer);
            foreach (var answer in question.Answer)
            {
                answer.QuestionId = id;
                if (answer.Id > 0)
                {
                    db.Entry(answer).State = EntityState.Modified;
                }
                else
                {
                    db.Entry(answer).State = EntityState.Added;
                }
            }
            db.Entry(question).State = EntityState.Modified;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!QuestionExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Ok();
        }

        // POST: api/Questions
        [ResponseType(typeof(Question))]
        public IHttpActionResult PostQuestion(Question question)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            question.CreateBy = Admin.IDAdmin.ToString();
            question.CreateDate = DateTime.UtcNow;
            db.Question.Add(question);
            db.SaveChanges();

            return Ok(question);
        }

        // DELETE: api/Questions/5
        [ResponseType(typeof(Question))]
        public IHttpActionResult DeleteQuestion(long id)
        {
            Question question = db.Question
                .Include(q => q.Answer)
                .Include(q => q.SessionAnswer)
                .Include(q => q.CourseQuestion)
                .FirstOrDefault(q => q.Id == id);
            if (question == null)
            {
                return NotFound();
            }
            question.Answer.Clear();
            question.SessionAnswer.Clear();
            question.CourseQuestion.Clear();
            db.Question.Remove(question);
            db.SaveChanges();

            return Ok(question);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool QuestionExists(long id)
        {
            return db.Question.Count(e => e.Id == id) > 0;
        }
    }
}