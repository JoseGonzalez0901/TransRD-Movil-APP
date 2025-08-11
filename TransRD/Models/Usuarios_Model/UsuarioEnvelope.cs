using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.Json.Serialization;
namespace TransRD.Models.Usuarios_Model
{
    public class UsuarioEnvelope
    {
        [JsonPropertyName("usuario")]
        public Usuario Usuario { get; set; }
    }

}
