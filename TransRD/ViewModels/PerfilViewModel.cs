using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;

namespace TransRD.ViewModels
{
    public partial class PerfilViewModel : ObservableObject
    {
        // Datos de usuario
        [ObservableProperty]
        private string nombre = "María González";

        [ObservableProperty]
        private string correo = "maria.gonzalez@email.com";

        [ObservableProperty]
        private string miembroDesde = "Member since Jan 2024";

        [ObservableProperty]
        private int notificaciones;

        public PerfilViewModel()
        {
            CargarNotificaciones();
        }

        private async void CargarNotificaciones()
        {
            // Simula llamada a una API
            await Task.Delay(500);
            Notificaciones = 3; // Simulación, puedes cambiar por datos reales
        }

        // COMANDOS DE NAVEGACIÓN

        [RelayCommand]
        private async Task IrAInformacionPersonal()
        {
            await Shell.Current.GoToAsync("/PersonalDataPage");
        }

        [RelayCommand]
        private async Task IrAMetodosPago()
        {
            await Shell.Current.GoToAsync("/PaymentMethodsPage");
        }

        [RelayCommand]
        private async Task IrAPrivacidad()
        {
            await Shell.Current.GoToAsync("/PrivacidadPage");
        }

        [RelayCommand]
        private async Task IrACentroDeAyuda()
        {
            await Shell.Current.GoToAsync("/CentroAyudaPage");
        }

        [RelayCommand]
        private async Task IrAContacto()
        {
            await Shell.Current.GoToAsync("/ContactoPage");
        }

        [RelayCommand]
        private async Task IrASobre()
        {
            await Shell.Current.GoToAsync("/SobrePage");
        }
    }
}
