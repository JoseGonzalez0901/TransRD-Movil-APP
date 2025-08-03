using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;
using TransRD.Models;
using TransRD.Services;

namespace TransRD.ViewModels
{
    public partial class PerfilViewModel : ObservableObject
    {
        private readonly IPerfilService perfilService;

        public PerfilViewModel()
        {
            perfilService = new PerfilService();
            CargarDatosPerfil();
        }

        // Propiedades del perfil
        [ObservableProperty]
        private string nombre;

        [ObservableProperty]
        private string correo;

        [ObservableProperty]
        private string miembroDesde;

        [ObservableProperty]
        private int notificaciones;

        private async void CargarDatosPerfil()
        {
            var perfil = await perfilService.ObtenerPerfilAsync();
            if (perfil != null)
            {
                Nombre = perfil.Nombre;
                Correo = perfil.Email;
                MiembroDesde = $"Member since {perfil.MiembroDesde}";
            }

            await Task.Delay(500); // Simula otra llamada para notificaciones
            Notificaciones = 3;
        }

        // COMANDOS DE NAVEGACIÓN

        [RelayCommand]
        private async Task IrAInformacionPersonal()
        {
            await Shell.Current.GoToAsync("///PersonalDataPage");
        }

        [RelayCommand]
        private async Task IrAMetodosPago()
        {
            await Shell.Current.GoToAsync("///PaymentMethodsPage");
        }

        [RelayCommand]
        private async Task IrAPrivacidad()
        {
            await Shell.Current.GoToAsync("///PrivacidadPage");
        }

        [RelayCommand]
        private async Task IrACentroDeAyuda()
        {
            await Shell.Current.GoToAsync("///CentroAyudaPage");
        }

        [RelayCommand]
        private async Task IrAContacto()
        {
            await Shell.Current.GoToAsync("///ContactoPage");
        }

        [RelayCommand]
        private async Task IrASobre()
        {
            await Shell.Current.GoToAsync("///SobrePage");
        }
    }
}
