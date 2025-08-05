using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TransRD.ViewModels
{
    public partial class ReportarProblemaViewModel : ObservableObject
    {
        [ObservableProperty]
        private string problemaSeleccionado;

        [ObservableProperty]
        private string tipoTransporteSeleccionado;

        [ObservableProperty]
        private string matricula = "A34526";

        [ObservableProperty]
        private string ubicacion = "Ubicación actual";

        [ObservableProperty]
        private string detallesAdicionales;

        public List<string> ProblemasDisponibles { get; } = new()
        {
            "Retraso",
            "Averías del Vehículo",
            "Preocupación de Seguridad",
            "Otro"
        };

        public List<string> TiposTransporteDisponibles { get; } = new()
        {
            "Metro", "OMSA", "Carro"
        };

        [RelayCommand]
        private void SeleccionarProblema(string problema)
        {
            ProblemaSeleccionado = problema;
        }

        [RelayCommand]
        private void SeleccionarTransporte(string tipo)
        {
            TipoTransporteSeleccionado = tipo;
        }

        [RelayCommand]
        private async Task GuardarReporteAsync()
        {
            if (string.IsNullOrWhiteSpace(ProblemaSeleccionado))
            {
                await Shell.Current.DisplayAlert("Error", "Selecciona un tipo de problema", "OK");
                return;
            }

            if (string.IsNullOrWhiteSpace(TipoTransporteSeleccionado))
            {
                await Shell.Current.DisplayAlert("Error", "Selecciona el tipo de transporte", "OK");
                return;
            }

            await Shell.Current.DisplayAlert("Reporte Enviado", "Gracias por tu reporte. Hemos recibido la información.", "OK");

            // Enviar reporte real a API si es necesario
        }
    }
}
