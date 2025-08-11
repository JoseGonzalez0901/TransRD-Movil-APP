using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace TransRD.Models
{
    public class UsuarioUpdate
    {
        [JsonPropertyName("nombre")]
        public string Nombre { get; set; }

        [JsonPropertyName("email")]
        public string Email { get; set; }

        [JsonPropertyName("telefono")]
        public string Telefono { get; set; }

        [JsonPropertyName("estado")]
        public string Estado { get; set; }

        [JsonPropertyName("foto")]
        public string Foto { get; set; }  // URL o base64 según tu API

        [JsonPropertyName("roles")]
        public string Roles { get; set; } // si tu API espera lista, usa List<string>

        [JsonPropertyName("fechaRegistro")]
        public DateTime? FechaRegistro { get; set; }

    }
   
}

