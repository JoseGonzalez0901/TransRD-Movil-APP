using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransRD.Models
{
    public class RegisterRequest
    {
        public string Username { get; set; }           // Nombre
        public string Email { get; set; }              // Email
        public string NumberPhone { get; set; }        // Teléfono
        public DateTime DateCreation { get; set; }     // Fecha de creación
        public string Status { get; set; }             // Estado
        public string Password { get; set; }           // Contraseña
    }



}
