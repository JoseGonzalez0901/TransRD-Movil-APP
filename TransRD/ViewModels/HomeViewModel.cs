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
        [ObservableProperty] private string rutaName;
        [ObservableProperty] private string estadoName;
        [ObservableProperty] private Color estado;
        [ObservableProperty] private string siguienteParada ;
        [ObservableProperty] private string eta = "3 min";
        [ObservableProperty] private string pasajeros = "1/45";
        [ObservableProperty]
        private string titulo = "Mi título de ejemplo";
        [ObservableProperty]
        private string descripcion = "Mi título de ejemplo";
        [ObservableProperty]
        private string fecha = "Mi título de ejemplo";


        [ObservableProperty] private ObservableCollection<Alerta> alertas;

        ViajesService _viajesService;
        ProblemaService _problemaService;
        private int IDViajeactual { get; set; }
        public HomeViewModel(ProblemaService problemaService,ViajesService viajesService)
        {
            _viajesService = viajesService;
            _problemaService = problemaService;
            alertas = new ObservableCollection<Alerta>();

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
           var ID= Preferences.Get("user_id", null);

            var alertasList = await _problemaService.ObtenerReportesAsync();
            var viajeactual = await _viajesService.ObtenerViajeActualAsync(ID);
            if(viajeactual!=null&&viajeactual.Estado=="Disponible")
            {
                RutaName = viajeactual.nombre_actual;
                Estado = Colors.LimeGreen;
                SiguienteParada = viajeactual.Destino;
                EstadoName = "Activo";
                IDViajeactual = viajeactual.ViajeId;
            }
            else
            {
                RutaName = "No hay viaje actual";
                EstadoName = "Inactivo";
                Eta = "N/A";
                Estado = Colors.Red;
                SiguienteParada = "No hay viaje actual";
            }
            Alertas.Clear();
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
            var ID = Preferences.Get("user_id", null);
            var viajeactual = await _viajesService.ObtenerViajeActualAsync(ID);
            if (viajeactual == null)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "No hay viaje actual para finalizar.", "OK");
                return;
            }
            bool confirm = await Application.Current.MainPage.DisplayAlert(
               "Terminar Viaje", "¿Estás seguro que deseas Terminar el viaje?", "Sí", "No");

            if (!confirm) return;
           
            var finalizar = new FinalizarViaje
            {
                Estado = "Terminado",
                Destino=viajeactual.Destino,
                Origen = viajeactual.Origen,
                UbicacionActual= viajeactual.Destino
            };
            _viajesService.finalizarViajeActulAsync(ID,finalizar);
            // Navegación o visualización de ruta
            //await Shell.Current.DisplayAlert("Ruta", "Mostrando ruta actual", "OK");
        }
    }
}
