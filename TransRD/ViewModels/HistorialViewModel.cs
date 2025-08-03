using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Graphics;

namespace TransRD.ViewModels
{
    public partial class HistorialViewModel : ObservableObject
    {
        [ObservableProperty]
        private ObservableCollection<Viaje> viajesFiltrados;

        public ICommand FiltrarCommand { get; }

        private List<Viaje> todosLosViajes;

        [ObservableProperty]
        private string categoriaSeleccionada = "Todos";

        public HistorialViewModel()
        {
            FiltrarCommand = new RelayCommand<string>(FiltrarPorCategoria);
            todosLosViajes = ObtenerViajes();
            ViajesFiltrados = new ObservableCollection<Viaje>();
            FiltrarPorCategoria("Todos");
        }

        private void FiltrarPorCategoria(string categoria)
        {
            CategoriaSeleccionada = categoria;

            var filtrados = categoria == "Todos"
                ? todosLosViajes
                : todosLosViajes.Where(v => v.Categoria == categoria);

            ViajesFiltrados.Clear();
            foreach (var viaje in filtrados)
                ViajesFiltrados.Add(viaje);
        }

        private List<Viaje> ObtenerViajes()
        {
            return new List<Viaje>
            {
                new Viaje("Metro línea 1", "Centro Olímpico → Villa Mella", "2:45 PM", "35 min", "RD$20", "Terminado", "Metro"),
                new Viaje("OMSA", "Zona Colonial → Gazcue", "11:20 AM", "22 min", "RD$15", "Terminado", "OMSA"),
                new Viaje("Carro Público", "Malecón → Plaza de Armas", "6:15 PM", "18 min", "RD$25", "Terminado", "Autos"),
                new Viaje("Metro línea 2", "Mamá Tingó → Villa Mella", "2:30 PM", "42 min", "RD$20", "Cancelado", "Metro"),
                new Viaje("OMSA Route 8", "Los Alcarrizos → Centro", "9:45 AM", "28 min", "RD$15", "Terminado", "OMSA"),
                new Viaje("Carro Público", "Bella Vista → Naco", "Lunes 4:20 PM", "15 min", "RD$30", "Terminado", "Autos")
            };
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
