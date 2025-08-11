using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using TransRD.Models.Usuarios_Model;

namespace TransRD.Models
{
    public class UpdateUsuarioRequest
    {
        [JsonPropertyName("token")]
        public string Token { get; set; }

        [JsonPropertyName("usuario")]
        public UsuarioUpdate Usuario { get; set; }
    }
}
