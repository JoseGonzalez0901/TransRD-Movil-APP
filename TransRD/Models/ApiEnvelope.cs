using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace TransRD.Models
{
    public class ApiEnvelope<T>
    {
        [JsonPropertyName("result")] public T? Result { get; set; }
        // opcionales: status, exception, etc. si los quieres leer
    }
}
