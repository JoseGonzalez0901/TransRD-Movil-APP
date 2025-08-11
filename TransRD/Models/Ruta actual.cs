using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransRD.Models
{
    public class Ruta_actual
    {
        public static Route Route { get; set; }
        public Ruta_actual()
        {
        }


        public void setRoute(Route route)
        {
            Route = route;
        }
        public Route GetRoute()
        {
            return Route;
        }
    }
}
