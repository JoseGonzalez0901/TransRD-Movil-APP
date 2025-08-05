using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using TransRD.Models;
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

        public HomeViewModel()
        {
            Alertas = new ObservableCollection<Alerta>
            {
                new Alerta { Titulo = "Desvío en ruta", Descripcion = "Se realizará un cambio temporal de ruta", Fecha = DateTime.Now.AddMinutes(-10) },
                new Alerta { Titulo = "Retraso", Descripcion = "Retraso estimado de 5 minutos", Fecha = DateTime.Now.AddMinutes(-25) }
            };
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
