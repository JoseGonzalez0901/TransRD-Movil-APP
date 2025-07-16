using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransRD.Models
{
    internal class User
    {
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Password { get; set; }
        public string? Token { get; set; }
        public bool IsLoggedIn { get; set; } = false;
        public bool IsAdmin { get; set; } = false;
        public bool IsPremium { get; set; } = false;
    }
}
