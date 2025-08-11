using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;
using System.Windows.Input;
using TransRD.Views;
using TransRD.Models;
using TransRD.Service;
namespace TransRD.ViewModels;

public partial class GestionarRutaViewModel : ObservableObject
{
    public ObservableCollection<Route> AvailableRoutes { get; set; } = new();

    public ObservableCollection<RutaItem> Rutas { get; } = new();

    public ViajesService _viajesService;

    public ICommand GoBackCommand { get; }
    public IRelayCommand<RutaItem> EditarCommand { get; }
    public IRelayCommand<RutaItem> EliminarCommand { get; }
    public IRelayCommand AgregarCommand { get; }

    public GestionarRutaViewModel(ViajesService viajesService)
    {
        _viajesService = viajesService;
        GoBackCommand = new RelayCommand(async () =>
        {
            // Navegación hacia atrás
            if (Application.Current?.MainPage is not null)
                await Application.Current.MainPage.Navigation.PopAsync();
        });

        EditarCommand = new RelayCommand<RutaItem>(async item =>
        {
            if (item is null) return;
            // TODO: Navegar a pantalla de edición con item.Id
            await Application.Current.MainPage.DisplayAlert("Editar", $"Editar: {item.Nombre}", "OK");
            Shell.Current.GoToAsync($"ModificarRutaPage?Id={item.Id}");
        });

        EliminarCommand = new RelayCommand<RutaItem>(async item =>
        {
            if (item is null) return;
            var ok = await Application.Current.MainPage.DisplayAlert("Eliminar", $"¿Eliminar \"{item.Nombre}\"?", "Sí", "No");
            if (ok) Rutas.Remove(item);
        });

        AgregarCommand = new RelayCommand(async () =>
        {
            // TODO: Navegar a crear nueva ruta
            Shell.Current.GoToAsync(nameof(AgregarRutaPage));
        });

        //Seed();
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
                    Rutas.Add(new RutaItem
                    {
                        Id = v.ViajeId.ToString(),
                        Nombre = $"{v.nombre_actual}",
                        Subtitulo = $"{v.UbicActual} → {v.Destino}",
                        Icon = icon,
                        IconBg = bg
                    });
                }
            });
            for (int i = 0; i < Rutas.Count; i++)
                Rutas[i].ShowTopDivider = i != 0;
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

    private void Seed()
    {
        // Colores de fondo de icono (como en tu referencia)
        var verde = Color.FromArgb("#DEF7EC");
        var morado = Color.FromArgb("#EDE9FE");
        var naranja = Color.FromArgb("#FEF3C7");

        // Items de ejemplo (ajusta a tu backend)
        Add("Línea 1 Metro", "12 vagones activos", "ic_metro.png", naranja);
        Add("OMSA Ruta 47", "8 autobuses activos", "ic_bus.png", verde);
        Add("27 de Febrero", "24 carros activos", "ic_car.png", morado);
        Add("Peralejos", "10 carros activos", "ic_car.png", morado);
        Add("Línea 2 Metro", "12 vagones activos", "ic_metro.png", naranja);
        Add("Tiradentes", "15 carros activos", "ic_car.png", morado);
        Add("OMSA Ruta 15", "10 autobuses activos", "ic_bus.png", verde);
        Add("OMSA Ruta 210", "30 autobuses activos", "ic_bus.png", verde);

        // marcar separadores (muestra línea sobre cada item excepto el primero)
        
    }

    private void Add(string nombre, string subtitulo, string icon, Color bg)
        => Rutas.Add(new RutaItem
        {
            Id = Guid.NewGuid().ToString(),
            Nombre = nombre,
            Subtitulo = subtitulo,
            Icon = icon,
            IconBg = bg
        });
}


