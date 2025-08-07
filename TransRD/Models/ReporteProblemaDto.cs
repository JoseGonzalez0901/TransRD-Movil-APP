using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransRD.Models
{
    public class ReporteProblemaDto
    {
        public int Id { get; set; }
        public int tipoProblemaId { get; set; }
        public int tipoTransporteId { get; set; }
        public double origen_Lat { get; set; }
        public double origen_Lng { get; set; }
        public string desc_Problema { get; set; }
    }
}
