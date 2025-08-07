using BruTile.Wms;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.Generic;
using System.Threading.Tasks;
using TransRD.Service;
using TransRD.Controls;
namespace TransRD.ViewModels
{
    public partial class ReportarProblemaViewModel : ObservableObject
    {
        [ObservableProperty]
        private string problemaSeleccionado;

        [ObservableProperty]
        private string tipoTransporteSeleccionado;

        [ObservableProperty]
        private string matricula;

        [ObservableProperty]
        private string ubicacion;

        [ObservableProperty]
        private string detallesAdicionales;

        private readonly ProblemaService _problemaService;

        public ReportarProblemaViewModel(ProblemaService  problemaService)
        {
            _problemaService= problemaService;
        }
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
           var location= await Mapcontrol.GetMyLocationAsync();

            
            
            var request= new Models.ReportarProblemaRequest
            {
                tipoProblemaId = ProblemasDisponibles.IndexOf(ProblemaSeleccionado)+1 ,
                tipoTransporteId = TiposTransporteDisponibles.IndexOf(TipoTransporteSeleccionado)+1,
                origen_Lat = location.Latitude,
                origen_Lng = location.Longitude,
                desc_Problema = DetallesAdicionales
            };

            bool resultado = await _problemaService.ReportarProblemaAsync(request);

            if (resultado)
                await Shell.Current.DisplayAlert("Reporte Enviado", "Gracias por tu reporte. Hemos recibido la información.", "OK");

            else
                await Shell.Current.DisplayAlert("Error", "Hubo un problema al reportar", "Cerrar");



            
        }
    }
}
