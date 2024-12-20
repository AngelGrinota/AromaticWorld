using DataAccessLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamWpfApp
{
    public static class UserSession
    {
        public static User? CurrentUser { get; set; } = null;
    }
}
