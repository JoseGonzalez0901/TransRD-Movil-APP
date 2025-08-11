using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace TransRD.Models
{
    public class IniciarViajeRequest
    {
        [JsonPropertyName("nombre_actual")]
        public string? NombreActual { get; set; }

        [JsonPropertyName("userId")]
        public int UserId { get; set; }

        [JsonPropertyName("viajeId")]
        public int ViajeId { get; set; }

        [JsonPropertyName("estado")]
        public string? Estado { get; set; }

        [JsonPropertyName("ubicacionActual")]
        public string? UbicacionActual { get; set; }

        [JsonPropertyName("destino")]
        public string? Destino { get; set; }

        [JsonPropertyName("origen")]
        public string? Origen { get; set; }

        [JsonPropertyName("fechaInicio")]
        public DateTime? FechaInicio { get; set; }

        [JsonPropertyName("fechaFin")]
        public DateTime? FechaFin { get; set; }

        [JsonPropertyName("costo")]
        public decimal Costo { get; set; }

        [JsonPropertyName("origenLat")]
        public double OrigenLat { get; set; }

        [JsonPropertyName("origenLong")]
        public double OrigenLong { get; set; }

        [JsonPropertyName("destLat")]
        public double DestLat { get; set; }

        [JsonPropertyName("destLong")]
        public double DestLong { get; set; }

        [JsonPropertyName("tipoId")]
        public int TipoId { get; set; }
    }
}
