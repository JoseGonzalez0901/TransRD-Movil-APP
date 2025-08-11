using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System;
using System.Text.Json.Serialization;
namespace TransRD.Models.Usuarios_Model
{
    public class Usuario
    {
        [JsonPropertyName("usuario_id")]
        public int UsuarioId { get; set; }

        [JsonPropertyName("nombre")]
        public string Nombre { get; set; }

        [JsonPropertyName("email")]
        public string Email { get; set; }

        [JsonPropertyName("contraseña")]
        public string Contraseña { get; set; }

        [JsonPropertyName("telefono")]
        public string Telefono { get; set; }

        [JsonPropertyName("fecha_registro")]
        public DateTime? FechaRegistro { get; set; }

        [JsonPropertyName("estado")]
        public string Estado { get; set; }

        [JsonPropertyName("foto")]
        public string Foto { get; set; }

        [JsonPropertyName("roles")]
        public string Roles { get; set; }

        [JsonPropertyName("viajes")]
        public List<object> Viajes { get; set; }

        [JsonPropertyName("cuentaSaldos")]
        public List<object> CuentaSaldos { get; set; }
    }


}
