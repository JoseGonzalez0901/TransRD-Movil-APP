using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;
using TransRD.Models;
using TransRD.Service;

namespace TransRD.ViewModels;

public partial class ModificarRutaViewModel : ObservableObject
{
    private readonly ViajesService _viajesService;

    // Id del viaje que se actualiza
    [ObservableProperty] private int viajeId;

    // Campos mínimos para el PUT (ajústalos a tus bindings/controles)
    [ObservableProperty] private int usuarioId ;
    [ObservableProperty] private int tipoId ; // 1=Metro, 2=OMSA, etc.

    // En tu UI tienes "Origen" y "Destino" como texto; los mapeo a UbicActual/Destino
    [ObservableProperty] private string origen;          // -> UbicActual
    [ObservableProperty] private string destino;     // -> Destino

    // Si no tienes capturas de lat/long en la UI, pon valores reales o deja 0
    [ObservableProperty] private double origenLat;
    [ObservableProperty] private double origenLong;
    [ObservableProperty] private double destLat;
    [ObservableProperty] private double destLong;

    // Horario: usa DateTime para el PUT (tu UI puede tener DatePicker/TimePicker)
    [ObservableProperty] private DateTime fechaInicio = DateTime.UtcNow;
    [ObservableProperty] private DateTime fechaFin    = DateTime.UtcNow.AddMinutes(30);

    [ObservableProperty] private decimal costo = 0;

    public ModificarRutaViewModel(ViajesService viajesService)
    {
        _viajesService = viajesService;
    }

    // Llámalo al navegar para precargar el formulario con el Viaje seleccionado
    public void CargarDesde(ViajeDto v)
    {
        ViajeId   = v.ViajeId;
        UsuarioId = v.UsuarioId;
        TipoId    = v.TipoId;

        Origen    = v.UbicActual ?? Origen;
        Destino   = v.Destino ?? Destino;

        OrigenLat  = v.OrigenLat;
        OrigenLong = v.OrigenLong;
        DestLat    = v.DestLat;
        DestLong   = v.DestLong;

        FechaInicio = v.FechaInicio;
        FechaFin    = v.FechaFin;

        Costo = v.Costo;
    }

    [RelayCommand]
    private async Task GuardarAsync()
    {
        var dto = new ViajeRequest
        {
            UsuarioId   = UsuarioId,
            TipoId      = TipoId,
            OrigenLat   = OrigenLat,
            OrigenLong  = OrigenLong,
            DestLat     = DestLat,
            DestLong    = DestLong,
            FechaInicio = FechaInicio, // ideal en UTC si tu API espera UTC
            FechaFin    = FechaFin,
            Costo       = Costo,
            UbicActual  = Origen,   // mapeo del campo de tu UI
            Destino     = Destino
        };

        var ok = await _viajesService.ActualizarViajeAsync(ViajeId, dto);
        if (ok)
            await Application.Current.MainPage.DisplayAlert("Éxito", "Viaje actualizado", "OK");
        else
            await Application.Current.MainPage.DisplayAlert("Error", "No se pudo actualizar el viaje", "OK");
    }
}
