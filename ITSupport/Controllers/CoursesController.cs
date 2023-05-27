using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using ITSupport.Models;
using System.Linq.Dynamic.Core;
using System.Web;

namespace ITSupport.Controllers
{
    public class CoursesController : ApiController
    {
        private ITSupportEntities db = new ITSupportEntities();

        // GET: api/Courses
        public IQueryable<Course> GetCourse()
        {
            return db.Course;
        }

        // GET: api/Courses/5
        [ResponseType(typeof(Course))]
        public IHttpActionResult GetCourse(long id)
        {
            Course course = db.Course.Find(id);
            if (course == null)
            {
                return NotFound();
            }

            return Ok(course);
        }

        [HttpGet]
        [Route("~/api/Courses/Page")]
        public IHttpActionResult Page([FromUri] int pageIndex, [FromUri] int pageSize, [FromUri] string search = null, [FromUri] string[] sort = null)
        {
            if (pageIndex < 1) pageIndex = 1;
            if (pageSize < 1) pageSize = 10;
            IQueryable<Course> query = db.Course
                .Include(c => c.CourseQuestion.Select((q) => q.Question))
                .AsNoTracking();
            db.Configuration.LazyLoadingEnabled = false;
            sort = sort.Where(s => !string.IsNullOrWhiteSpace(s)).ToArray();
            if (sort == null || sort.Length == 0)
            {
                sort = new string[] { $"{nameof(Question.CreateDate)} desc" };
            }
            if (!string.IsNullOrEmpty(search))
                query = query.Where(q => q.Name.Contains(search) || q.Describe.Contains(search));
            query = query.OrderBy(string.Join(",", sort));
            var count = query.Count();
            var result = query.Skip(pageIndex * pageSize - pageSize).Take(pageSize).ToList();
            return Ok(new { total = count, items = result });
        }

        [HttpPatch]
        [ResponseType(typeof(void))]
        public IHttpActionResult PatchCourse(long id, [FromBody] IEnumerable<CourseQuestion> questions, [FromUri] int? time = null)
        {
            var course = db.Course.Include(c => c.CourseQuestion).FirstOrDefault(c => c.IDCourse == id);
            if (course == null) return NotFound();
            course.CourseQuestion.Clear();
            course.TestTime = time;
            foreach (var item in questions)
            {
                item.CourseId = id;
                course.CourseQuestion.Add(item);
            }
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CourseExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }
        // PUT: api/Courses/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutCourse(long id, Course course)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != course.IDCourse)
            {
                return BadRequest();
            }
            db.Entry(course).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CourseExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Courses
        [ResponseType(typeof(Course))]
        public IHttpActionResult PostCourse(Course course)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Course.Add(course);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = course.IDCourse }, course);
        }

        // DELETE: api/Courses/5
        [ResponseType(typeof(Course))]
        public IHttpActionResult DeleteCourse(long id)
        {
            Course course = db.Course.Find(id);
            if (course == null)
            {
                return NotFound();
            }

            db.Course.Remove(course);
            db.SaveChanges();

            return Ok(course);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CourseExists(long id)
        {
            return db.Course.Count(e => e.IDCourse == id) > 0;
        }

        public class AnswerRequestDto
        {
            public long QuestionId { get; set; }
            public long AnswerId { get; set; }
        }

        [HttpPost]
        [Route("~/api/Courses/Verify/{id}")]
        public IHttpActionResult VerifyAnswer(long id, [FromUri(Name = "s")] long sessionId, [FromBody] IEnumerable<AnswerRequestDto> answers)
        {
            db.Configuration.LazyLoadingEnabled = false;
            var session = db.TestSession.Find(sessionId);
            if (session == null) return BadRequest();
            if (session.EndTime.HasValue)
            {
                return BadRequest();
            }
            session.EndTime = DateTimeOffset.Now;
            var questions = db.Question.Where(q => q.CourseQuestion.Any(cq => cq.CourseId == id))
                .Include(q => q.Answer).ToList();
            var correctQuestions = questions
                .Where(q => q.Answer
                .Where(a => a.IsCorrect.HasValue && a.IsCorrect.Value)
                .All(a => answers.Where(an => an.QuestionId == q.Id)
                .Any(an => a.Id == an.AnswerId)))
                .ToList();
            var correctAnswer = questions.SelectMany(q => q.Answer.Where(a => a.IsCorrect.HasValue && a.IsCorrect.Value));
            foreach (var item in answers)
            {
                var correct = correctAnswer.Any(a => a.Id == item.AnswerId && a.QuestionId == item.QuestionId);

                db.SessionAnswer.Add(new SessionAnswer
                {
                    IsCorrect = correct,
                    AnswerId = item.AnswerId,
                    QuestionId = item.QuestionId,
                    SessionId = session.Id,
                    CreatedAt = DateTimeOffset.Now
                });
            }
            session.Total = questions.Count;
            session.Correct = correctQuestions.Count;
            db.SaveChanges();
            return Ok(new
            {
                session.Correct,
                session.Total,
                session.StartTime,
                session.EndTime
            });
        }

        [HttpGet]
        [Route("~/api/Courses/Result")]
        public IHttpActionResult Result([FromUri] int pageIndex, [FromUri] int pageSize, [FromUri] string search = null, [FromUri] string[] sort = null)
        {
            if (pageIndex < 1) pageIndex = 1;
            if (pageSize < 1) pageSize = 10;
            db.Configuration.LazyLoadingEnabled = false;
            IQueryable<TestSession> query = db.TestSession
                .Include(s => s.User)
                .Include(s => s.Course)
                .Include(s => s.Course.CourseQuestion.Select(c => c.Question))
                .Include(s => s.SessionAnswer)
                .AsNoTracking();
            db.Configuration.LazyLoadingEnabled = false;
            sort = sort.Where(s => !string.IsNullOrWhiteSpace(s)).ToArray();
            if (sort == null || sort.Length == 0)
            {
                sort = new string[] { $"{nameof(TestSession.StartTime)} desc" };
            }
            if (!string.IsNullOrEmpty(search))
                query = query.Where(q => q.User.Name.Contains(search) || q.Course.Name.Contains(search));
            query = query.OrderBy(string.Join(",", sort));
            var count = query.Count();
            var result = query.Skip(pageIndex * pageSize - pageSize).Take(pageSize).ToList();
            return Ok(new { total = count, items = result });
        }
    }
}