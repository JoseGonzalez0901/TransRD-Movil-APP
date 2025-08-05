using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransRD.Models.Usuarios_Model
{
    public class Usuario
    {
        public int UsuarioId { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Contraseña { get; set; }
        public string Telefono { get; set; }
        public DateTime? FechaRegistro { get; set; }
        public string Estado { get; set; }
        public string Foto { get; set; }
        public string Roles { get; set; }
    }

}
