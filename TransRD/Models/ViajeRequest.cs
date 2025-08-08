using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace TransRD.Models
{
    public class ViajeRequest
    {
        [JsonPropertyName("usuarioId")] public int UsuarioId { get; set; }
        [JsonPropertyName("tipoId")] public int TipoId { get; set; }
        [JsonPropertyName("origenLat")] public double OrigenLat { get; set; }
        [JsonPropertyName("origenLong")] public double OrigenLong { get; set; }
        [JsonPropertyName("destLat")] public double DestLat { get; set; }
        [JsonPropertyName("destLong")] public double DestLong { get; set; }
        [JsonPropertyName("fechaInicio")] public DateTime FechaInicio { get; set; }
        [JsonPropertyName("fechaFin")] public DateTime FechaFin { get; set; }
        [JsonPropertyName("costo")] public decimal Costo { get; set; }
        [JsonPropertyName("ubicActual")] public string? UbicActual { get; set; }
        [JsonPropertyName("destino")] public string? Destino { get; set; }
    }
}
