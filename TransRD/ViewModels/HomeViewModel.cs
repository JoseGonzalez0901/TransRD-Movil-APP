using System.Collections.ObjectModel;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using Microsoft.Maui.Graphics;
using TransRD.Models;
using Microsoft.Maui.Graphics;
using System.ComponentModel;
using System.Runtime.CompilerServices;
namespace TransRD.ViewModels
{
    public class HomeViewModel : ObservableObject
    {
        // Rutas disponibles
        public ObservableCollection<Route> AvailableRoutes { get; set; }

        // Comando de selección de transporte
        public ICommand SelectTransportCommand { get; }

        private string _selectedTransport;
        public string SelectedTransport
        {
            get => _selectedTransport;
            set
            {
                if (_selectedTransport != value)
                {
                    _selectedTransport = value;
                    OnPropertyChanged();

                    // Notificar cambio de estilos visuales
                    OnPropertyChanged(nameof(MetroBackground));
                    OnPropertyChanged(nameof(MetroTextColor));
                    OnPropertyChanged(nameof(OMSA_Background));
                    OnPropertyChanged(nameof(OMSA_TextColor));
                    OnPropertyChanged(nameof(PublicosBackground));
                    OnPropertyChanged(nameof(PublicosTextColor));
                }
            }
        }

        // Estilos dinámicos para botón "Metro"
        public Color MetroBackground => SelectedTransport == "Metro" ? Microsoft.Maui.Graphics.Color.FromArgb("#ff6d00") : Colors.LightGray;
        public Color MetroTextColor => SelectedTransport == "Metro" ? Colors.White : Colors.Black;

        // Estilos dinámicos para botón "OMSA"
        public Color OMSA_Background => SelectedTransport == "OMSA" ? Microsoft.Maui.Graphics.Color.FromArgb("#64dd17") : Colors.LightGray;
        public Color OMSA_TextColor => SelectedTransport == "OMSA" ? Colors.White : Colors.Black;

        // Estilos dinámicos para botón "Públicos"
        public Color PublicosBackground => SelectedTransport == "Públicos" ? Microsoft.Maui.Graphics.Color.FromArgb("#aa00ff") : Colors.LightGray;
        public Color PublicosTextColor => SelectedTransport == "Públicos" ? Colors.White : Colors.Black;

        public HomeViewModel()
        {
            // Inicializar rutas
            AvailableRoutes = new ObservableCollection<Route>
            {
                new Route
                {
                    Line = "Línea 1 - Centro",
                    Time = "10 min · 3 paradas",
                    Status = "A tiempo",
                    StatusColor = Colors.Green,
                    Icon = "train_white_icon.png",
                    Backgraound= Microsoft.Maui.Graphics.Color.FromArgb("#ff6d00") // Color del fondo para Metro
                }
            };

            // Inicializar comando
            SelectTransportCommand = new Command<string>(OnSelectTransport);

            // Valor inicial
            SelectedTransport = "Metro";
        }

        private void OnSelectTransport(string selected)
        {
            SelectedTransport = selected;
            AvailableRoutes[0].Icon= selected switch
            {
                "Metro" => "train_white_icon.png",
                "OMSA" => "bus_white_icon.png",
                "Públicos" => "car_white_icon.png",
                _ => AvailableRoutes[0].Icon
            };
            AvailableRoutes[0].Backgraound = selected switch
            {
                "Metro" => Microsoft.Maui.Graphics.Color.FromArgb("#ff6d00"),
                "OMSA" => Microsoft.Maui.Graphics.Color.FromArgb("#64dd17"),
                "Públicos" => Microsoft.Maui.Graphics.Color.FromArgb("#aa00ff"),
                _ => Colors.LightGray
            };
            if(selected=="Metro")
            {
                AvailableRoutes[0].Status = "A tiempo";
                AvailableRoutes[0].StatusColor = Colors.Green;
            }
            else if(selected=="OMSA")
            {
                AvailableRoutes[0].Status = "En ruta";
                AvailableRoutes[0].StatusColor = Colors.Orange;
            }
            else if(selected=="Públicos")
            {
                AvailableRoutes[0].Status = "Demorado";
                AvailableRoutes[0].StatusColor = Colors.Red;
            }
            // Aquí puedes agregar lógica adicional si necesitas
            // como mostrar rutas específicas o colocar pines
        }
    }
}
