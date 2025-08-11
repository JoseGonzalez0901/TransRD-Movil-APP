using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Graphics;
using TransRD.Service;

namespace TransRD.ViewModels
{
    public partial class HistorialViewModel : ObservableObject
    {
        [ObservableProperty]
        private ObservableCollection<Viaje> viajesFiltrados;

        public ICommand FiltrarCommand { get; }

        private List<Viaje> todosLosViajes;
        private ViajesService _viajesService;  

        [ObservableProperty]
        private string categoriaSeleccionada = "Todos";

        public HistorialViewModel(ViajesService viajesService)
        {
            _viajesService = viajesService;
            FiltrarCommand = new RelayCommand<string>(FiltrarPorCategoria);
            ViajesFiltrados = new ObservableCollection<Viaje>();
            todosLosViajes = new List<Viaje>();
            ObtenerViajes();
           
        }

        private void FiltrarPorCategoria(string categoria)
        {
            CategoriaSeleccionada = categoria;
            if (categoria == "Todos")
            {
                viajesFiltrados.Clear();
                foreach (var viaje in todosLosViajes)
                {
                    viajesFiltrados.Add(viaje);
                }
            }
            else
            {
                var filtrados = categoria == "Todos"
               ? todosLosViajes
               : todosLosViajes.Where(v => v.Categoria == categoria);

                ViajesFiltrados.Clear();
                foreach (var viaje in filtrados)
                    ViajesFiltrados.Add(viaje);
            }
           
        }

        private async Task ObtenerViajes()
        {

           var ID= Preferences.Get("user_id", null);

           var Viajes= await _viajesService.ObtenerHistorialViajesAsync(ID);
            foreach (var viaje in Viajes)
            {
                var nuevoViaje = new Viaje(
                    hora: "10:00",
                    duracion: "30 min",
                    titulo: $"{viaje.nombre_actual}",
                    ruta: $"{viaje.Origen} - {viaje.Destino}",
                    costo: $"RD$ {viaje.Costo}",
                    estado: viaje.Estado,
                    categoria: viaje.TipoId == 1 ? "Metro" : viaje.TipoId == 2 ? "OMSA" : "Públicos"
                );
                todosLosViajes.Add(nuevoViaje);
            }
            FiltrarPorCategoria("Todos");

        }
    }

    public class Viaje
    {
        public string Titulo { get; set; }
        public string Ruta { get; set; }
        public string Hora { get; set; }
        public string Duracion { get; set; }
        public string Costo { get; set; }
        public string Estado { get; set; }
        public string Categoria { get; set; }

        public Color EstadoColor => Estado switch
        {
            "Terminado" => Colors.Green,
            "Cancelado" => Colors.Red,
            _ => Colors.Gray
        };

        public Viaje(string titulo, string ruta, string hora, string duracion, string costo, string estado, string categoria)
        {
            Titulo = titulo;
            Ruta = ruta;
            Hora = hora;
            Duracion = duracion;
            Costo = costo;
            Estado = estado;
            Categoria = categoria;
        }
    }
}
