using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Classes
{
    public class Topic
    {
        public string ResearchTitle { get; set; }
        public string ResearchDesc { get; set; }
        public int FirstAdviser { get; set; }
        public int SecondAdviser { get; set; }
        public string ResearchStatus { get; set; }
        public string ResearchCateg { get; set; }

    }
}