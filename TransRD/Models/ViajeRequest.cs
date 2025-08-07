using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransRD.Models
{
    public class ViajeRequest
    {
        public int usuarioID { get; set; }
        public int tipoID { get; set; }
        public double origenLat { get; set; }
        public double origenLong { get; set; }
        public double destLat { get; set; }
        public double destLong { get; set; }
        public DateTime fechaInicio { get; set; }
        public DateTime fechaFin { get; set; }
        public decimal costo { get; set; }
        public string ubicActual { get; set; }
        public string destino { get; set; }
    }
}
