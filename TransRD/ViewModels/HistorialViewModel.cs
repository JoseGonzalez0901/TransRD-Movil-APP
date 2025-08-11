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
