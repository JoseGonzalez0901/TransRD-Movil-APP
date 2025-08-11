using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;
using TransRD.Service;

namespace TransRD.ViewModels;

public partial class AgregarRutaViewModel : ObservableObject
{
    [ObservableProperty] private string nombreRuta;
    [ObservableProperty] private string origen;
    [ObservableProperty] private string destino;
    [ObservableProperty] private string paradas;
    [ObservableProperty] private string horario;
    [ObservableProperty] private string estado;

    public ObservableCollection<VehiculoItem> Vehiculos { get; set; } = new();
    public ViajesService _viajesService;
    public AgregarRutaViewModel(ViajesService viajesService)
    {
        _viajesService = viajesService;
        // Ejemplo de 4 campos de placas
        Vehiculos.Add(new VehiculoItem { Placa = "" });
        Vehiculos.Add(new VehiculoItem { Placa = "" });
        Vehiculos.Add(new VehiculoItem { Placa = "" });
        Vehiculos.Add(new VehiculoItem { Placa = "" });
    }

    [RelayCommand]
    private async Task Guardar()
    {
        // Aquí conectas con tu API
        _viajesService.CrearViajeAsync(new()
        {
            UbicActual = Origen,
            Destino = Destino,
            Costo = 0, // Ajusta según tu modelo
            
        });
        await Application.Current.MainPage.DisplayAlert("Guardar", "Ruta agregada correctamente", "OK");
    }
}

public partial class VehiculoItem : ObservableObject
{
    [ObservableProperty] private string placa;
}
