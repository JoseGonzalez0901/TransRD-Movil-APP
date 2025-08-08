using System.Collections.ObjectModel;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using Microsoft.Maui.Graphics;
using TransRD.Models;
using TransRD.Service;

namespace TransRD.ViewModels
{
    public class RoutesViewModel : ObservableObject
    {
        public ObservableCollection<Route> AvailableRoutes { get; set; } = new();
        public ViajesService _viajesService;
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

        public RoutesViewModel(ViajesService viajesService)
        {
            SelectTransportCommand = new Command<string>(OnSelectTransport);
            SelectedTransport = "Metro";
            _viajesService = viajesService;
        }

        public async Task LoadAsync(CancellationToken ct = default)
        {
            try
            {
                // 1) Llamar al servicio y ESPERAR la respuesta
                var viajes = await _viajesService.ObtenerViajesAsync(ct);

                // 2) Actualizar la lista (en el hilo de UI por seguridad)
                MainThread.BeginInvokeOnMainThread(() =>
                {
                    AvailableRoutes.Clear();

                    foreach (var v in viajes)
                    {
                        var (status, color) = GetStatus(v);

                        var (icon, bg) = v.TipoId switch
                        {
                            1 => ("train_white_icon.png", Color.FromArgb("#ff6d00")), // Metro
                            2 => ("bus_white_icon.png", Color.FromArgb("#16a34a")), // OMSA
                            _ => ("car_white_icon.png", Color.FromArgb("#7c3aed"))  // Carro/otro
                        };

                        AvailableRoutes.Add(new Route
                        {
                            Line = $"Viaje {v.ViajeId}",
                            // Muestra origen → destino (ajústalo a tu UI)
                            Time = $"{v.UbicActual} → {v.Destino}",
                            Status = status,
                            StatusColor = color,
                            Icon = icon,
                            Backgraound = bg
                        });
                    }
                });

                OnPropertyChanged(nameof(AvailableRoutes));
            }
            catch (Exception ex)
            {
                // Loguea o muestra un alert si quieres
                System.Diagnostics.Debug.WriteLine(ex);
            }
        }
        private static (string status, Color color) GetStatus(ViajeDto v)
        {
            // Si tu API entrega UTC con "Z", compara en UTC
            var now = DateTime.UtcNow;

            if (now < v.FechaInicio) return ("Pendiente", Colors.Gray);
            if (now <= v.FechaFin) return ("En curso", Colors.Orange);
            return ("Completado", Colors.Green);
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
