using System.Collections.ObjectModel;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using Microsoft.Maui.Graphics;
using TransRD.Models;

namespace TransRD.ViewModels
{
    public class RoutesViewModel : ObservableObject
    {
        public ObservableCollection<Route> AvailableRoutes { get; set; } = new();

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
                    UpdateTransportVisuals();
                }
            }
        }

        // Colores dinámicos para Metro
        public Color MetroBackground => SelectedTransport == "Metro" ? Color.FromArgb("#ff6d00") : Colors.LightGray;
        public Color MetroTextColor => SelectedTransport == "Metro" ? Colors.White : Colors.Black;

        // OMSA
        public Color OMSA_Background => SelectedTransport == "OMSA" ? Color.FromArgb("#64dd17") : Colors.LightGray;
        public Color OMSA_TextColor => SelectedTransport == "OMSA" ? Colors.White : Colors.Black;

        // Públicos
        public Color PublicosBackground => SelectedTransport == "Públicos" ? Color.FromArgb("#aa00ff") : Colors.LightGray;
        public Color PublicosTextColor => SelectedTransport == "Públicos" ? Colors.White : Colors.Black;

        public RoutesViewModel()
        {
            SelectTransportCommand = new Command<string>(OnSelectTransport);
            SelectedTransport = "Metro";
        }

        public async Task LoadAsync()
        {
            // Simulación de carga de datos iniciales
            await Task.Delay(50); // opcional

            AvailableRoutes.Clear();
            AvailableRoutes.Add(new Route
            {
                Line = "Línea 1 - Centro",
                Time = "10 min · 3 paradas",
                Status = "A tiempo",
                StatusColor = Colors.Green,
                Icon = "train_white_icon.png",
                Backgraound = Color.FromArgb("#ff6d00")
            });

            OnPropertyChanged(nameof(AvailableRoutes));
        }

        private void OnSelectTransport(string selected)
        {
            SelectedTransport = selected;

            var icon = selected switch
            {
                "Metro" => "train_white_icon.png",
                "OMSA" => "bus_white_icon.png",
                "Públicos" => "car_white_icon.png",
                _ => "train_white_icon.png"
            };

            var color = selected switch
            {
                "Metro" => Color.FromArgb("#ff6d00"),
                "OMSA" => Color.FromArgb("#64dd17"),
                "Públicos" => Color.FromArgb("#aa00ff"),
                _ => Colors.LightGray
            };

            var status = selected switch
            {
                "Metro" => ("A tiempo", Colors.Green),
                "OMSA" => ("En ruta", Colors.Orange),
                "Públicos" => ("Demorado", Colors.Red),
                _ => ("Desconocido", Colors.Gray)
            };

            if (AvailableRoutes.Count > 0)
            {
                var route = AvailableRoutes[0];
                route.Icon = icon;
                route.Backgraound = color;
                route.Status = status.Item1;
                route.StatusColor = status.Item2;
                OnPropertyChanged(nameof(AvailableRoutes));
            }
        }

        private void UpdateTransportVisuals()
        {
            OnPropertyChanged(nameof(MetroBackground));
            OnPropertyChanged(nameof(MetroTextColor));
            OnPropertyChanged(nameof(OMSA_Background));
            OnPropertyChanged(nameof(OMSA_TextColor));
            OnPropertyChanged(nameof(PublicosBackground));
            OnPropertyChanged(nameof(PublicosTextColor));
        }
    }
}
