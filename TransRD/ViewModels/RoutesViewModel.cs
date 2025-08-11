using System.Collections.ObjectModel;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Graphics;
using TransRD.Models;
using TransRD.Service;

namespace TransRD.ViewModels
{
    public partial class RoutesViewModel : ObservableObject
    {
        public ObservableCollection<Route> AvailableRoutes { get; set; } = new();
        public ViajesService _viajesService;
        public IniciarViajeRequest ViajeDto { get; set; } = new();
        List<Route> showoutes = new();
        [ObservableProperty]
        private Route? selectedRoute;
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
                    showoutes.Clear();

                    foreach (var v in viajes)
                    {
                        var (status, color) = GetStatus(v);

                        var (icon, bg) = v.TipoId switch
                        {
                            1 => ("train_white_icon.png", Color.FromArgb("#ff6d00")), // Metro
                            2 => ("bus_white_icon.png", Color.FromArgb("#16a34a")), // OMSA
                            _ => ("car_white_icon.png", Color.FromArgb("#7c3aed"))  // Carro/otro
                        };



                        showoutes.Add(new Route
                        {
                            Id_Ruta = v.ViajeId,
                            Nombre_Ruta = v.nombre_actual,
                            Tipo_Viaje = v.TipoId,
                            Line = $"{v.nombre_actual}",
                            // Muestra origen → destino (ajústalo a tu UI)
                            Time = $"{v.UbicActual} → {v.Destino}",
                            Status = v.Estado,
                            StatusColor = color,
                            Icon = icon,
                            Backgraound = bg
                        });
                    }
                });
                if (viajes.Count > 0)
                {
                    OnSelectTransport(SelectedTransport);
                }

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
        public List<string> TiposTransporteDisponibles { get; } = new()
        {
            "Metro", "OMSA", "Carro"
        };

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

           var id_transporte= TiposTransporteDisponibles.IndexOf(selected)+1;

            AvailableRoutes.Clear();

            if (showoutes.Count > 0)
            {
                foreach (var route in showoutes)
                {
                    if(route.Tipo_Viaje==id_transporte)
                    {
                        route.Line = $"{route.Line}";
                        route.Icon = icon;
                        route.Backgraound = color;
                        route.Status = route.Status;
                        route.StatusColor = status.Item2;
                        AvailableRoutes.Add(route);
                    }
                }
                OnPropertyChanged(nameof(AvailableRoutes));
            }
        }
        [RelayCommand]
        private async Task Planificar()
        {
            if(ViajeDto is null || SelectedRoute is null)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Viaje no seleccionado", "OK");
            }
            else
            {
                var confirm = _viajesService.IniciarViaje(ViajeDto);
                ViajeDto = new IniciarViajeRequest();
                SelectedRoute = null;
            }
      
            
        }
        [RelayCommand]
        private async Task SeleccionarRuta(Route? route)
        {
            if (route is null) return;

         var ID=  Convert.ToInt16( Preferences.Get("user_id", null));
            ViajeDto = new IniciarViajeRequest
            {
                ViajeId=route.Id_Ruta, // Asigna el ID del viaje si es necesario
                Costo = 0, // Asigna el costo si es necesario
                Origen = "route.UbicacionActual",
                OrigenLat = 21, // Asigna latitud real si tienes
                OrigenLong = 21, // Asigna longitud real si tienes
                DestLat = 21, // Asigna latitud real si tienes
                DestLong = 21, // Asigna longitud real si tienes
                FechaInicio = DateTime.UtcNow, // Usa UTC si tu API lo espera
                FechaFin = DateTime.UtcNow.AddMinutes(30), // Ajusta según tu lógica
                UserId=ID,
                NombreActual = route.Nombre_Ruta,
                TipoId = route.Tipo_Viaje,
                UbicacionActual = route.Time.Split('→')[0].Trim(),
                Destino = route.Time.Split('→')[1].Trim(),
                Estado = route.Status
            };
            // 1) Selecciona para que el VisualState "Selected" pinte el Frame
            SelectedRoute = route;

            // 2) Tu acción (navegar, llamar API, etc.)
            // await Shell.Current.GoToAsync($"{nameof(DetalleRutaPage)}?id={route.Id}");

            // 3) Deja ver el highlight un instante y desmarca
            await Task.Delay(120);
             // vuelve al estado normal sin salir de la página
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
