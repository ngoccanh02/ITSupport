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
    
    public partial class Quiz
    {
        public int QuizId { get; set; }
        public Nullable<System.TimeSpan> Duration { get; set; }
        public Nullable<System.DateTime> EndTime { get; set; }
        public int Score { get; set; }
        public Nullable<System.DateTime> StartTime { get; set; }
        public string Questions { get; set; }
    }
}
