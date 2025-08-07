using System.Collections.ObjectModel;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

namespace TransRD.ViewModels;

public partial class AdminDashboardViewModel : ObservableObject
{
    // Estadísticas
    [ObservableProperty] private int vehiculosActivos = 847;
    [ObservableProperty] private string usuariosActivos = "12.5K";
    [ObservableProperty] private int rutasActivas = 156;
    [ObservableProperty] private int alertas = 23;

    // Lista de estado por línea o tipo de transporte
    public ObservableCollection<EstadoItem> EstadoTransporte { get; } = new()
    {
        new EstadoItem("icon_metro.png", "Linea 1 Metro", "12 vagones activos", "Normal", "#E9FDF1", "#065F46"),
        new EstadoItem("icon_bus.png", "OMSA Ruta 47", "8 autobuses activos", "Retrasado", "#FEF3C7", "#92400E"),
        new EstadoItem("icon_car.png", "Carros Públicos", "24 carros activos", "Normal", "#E9FDF1", "#065F46")
    };

    // Alertas recientes
    public ObservableCollection<AlertaItem> AlertasRecientes { get; } = new()
    {
        new AlertaItem("Averías de Vehículos", "OMSA Bus #47-12 problema mecánico reportado", "Hace 2 min"),
        new AlertaItem("Retraso de la ruta", "Línea 2 Metro con 10 min de retraso", "Hace 5 min"),
        new AlertaItem("Sistema Actualizado", "Sistema de rastreo GPS actualizado", "Hace 15 min")
    };

    // Comandos
    public ICommand VerEstadoCommand => new RelayCommand(OnVerEstado);
    public ICommand AgregarVehiculoCommand => new RelayCommand(OnAgregarVehiculo);
    public ICommand GestionarRutasCommand => new RelayCommand(OnGestionarRutas);
    public ICommand VerReportesCommand => new RelayCommand(OnVerReportes);

    private void OnVerEstado()
    {
        // Lógica para navegación o mostrar estado detallado
    }

    private void OnAgregarVehiculo()
    {
        // Navegación o acción
    }

    private void OnGestionarRutas()
    {
        // Navegación o acción
    }

    private void OnVerReportes()
    {
        // Navegación o acción
    }
}

public record EstadoItem(string Icon, string Nombre, string Subtexto, string Estado, string EstadoFondo, string EstadoColor);
public record AlertaItem(string Titulo, string Descripcion, string Tiempo);
