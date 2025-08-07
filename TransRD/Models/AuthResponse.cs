using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransRD.Models
{
    public class AuthResponse
    {
        public string Token { get; set; }
        public string Rol { get; set; } // opcional, si se maneja roles
        public string Message { get; set; } // opcional
    }

}
