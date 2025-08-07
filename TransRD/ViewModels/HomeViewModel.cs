using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using TransRD.Models;
using TransRD.Service;
using TransRD.Views;

namespace TransRD.ViewModels
{
    public partial class HomeViewModel : ObservableObject
    {
        [ObservableProperty] private string siguienteParada = "Plaza de la Cultura";
        [ObservableProperty] private string eta = "3 min";
        [ObservableProperty] private string pasajeros = "12/45";
        [ObservableProperty]
        private string titulo = "Mi título de ejemplo";
        [ObservableProperty]
        private string descripcion = "Mi título de ejemplo";
        [ObservableProperty]
        private string fecha = "Mi título de ejemplo";


        [ObservableProperty] private ObservableCollection<Alerta> alertas;


        ProblemaService _problemaService;
        public HomeViewModel(ProblemaService problemaService)
        {
            _problemaService = problemaService;
            
        }
        public List<string> ProblemasDisponibles { get; } = new()
        {
            "Retraso",
            "Averías del Vehículo",
            "Preocupación de Seguridad",
            "Otro"
        };
        public async Task LoadAlertasAsync()
        {
            var alertasList = await _problemaService.ObtenerReportesAsync();
            foreach (var alerta in alertasList)
            {
                Alertas.Add(
                    new Alerta
                    {
                        Titulo = ProblemasDisponibles[alerta.tipoProblemaId - 1],
                        Descripcion = alerta.desc_Problema,
                    }
                    );
            }
        }

        [RelayCommand]
        private async Task ReportarProblema()
        {
            // Lógica de reporte
            await Shell.Current.GoToAsync(nameof(ReportarProblemaPage));
       
        }

        [RelayCommand]
        private async Task VerRuta()
        {
            // Navegación o visualización de ruta
            await Shell.Current.DisplayAlert("Ruta", "Mostrando ruta actual", "OK");
        }
    }
}
