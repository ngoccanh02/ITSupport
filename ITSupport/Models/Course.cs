//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ITSupport.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Course
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Course()
        {
            this.CourseQuestion = new HashSet<CourseQuestion>();
            this.Lesson1 = new HashSet<Lesson>();
            this.TestSession = new HashSet<TestSession>();
        }
    
        public long IDCourse { get; set; }
        public string Name { get; set; }
        public Nullable<decimal> Saleprice { get; set; }
        public string Describe { get; set; }
        public string Images { get; set; }
        public Nullable<int> IDCreator { get; set; }
        public Nullable<int> IDTopic { get; set; }
        public Nullable<int> IDPH { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public string CreateBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<int> TestTime { get; set; }
        public Nullable<long> IDLesson { get; set; }
    
        public virtual ACourse ACourse { get; set; }
        public virtual Lesson Lesson { get; set; }
        public virtual PublishingHouse PublishingHouse { get; set; }
        public virtual Topic Topic { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CourseQuestion> CourseQuestion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Lesson> Lesson1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TestSession> TestSession { get; set; }
    }
}
