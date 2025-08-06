using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Diagnostics;
using System.Threading.Tasks;
using TransRD.Models;
using TransRD.Interfaces;
using TransRD.Views;
using TransRD.Models.Usuarios_Model;

namespace TransRD.ViewModels
{
    public partial class PerfilViewModel : ObservableObject
    {
        // Propiedades del perfil
        [ObservableProperty]
        private string nombre;

        [ObservableProperty]
        private string correo;

        [ObservableProperty]
        private string miembroDesde;

        [ObservableProperty]
        private int notificaciones;

        private readonly IAuthService _authService;
        private readonly IPerfilService _perfilservice;
        public PerfilViewModel(IPerfilService perfilService)
        {
            _perfilservice = perfilService;

            CargarPerfil();
        }

        public async Task CargarPerfil()
        {
            try
            {
                var usuario = await _perfilservice.ObtenerPerfilAsync();

                if (usuario != null)
                {
                    Nombre = usuario.Nombre;
                    Correo = usuario.Email;
                    MiembroDesde = usuario.FechaRegistro?.ToString("MMMM yyyy") ?? "Desconocido";
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error al cargar el perfil: {ex.Message}");
            }
        }


        [RelayCommand]
        private async Task Logout()
        {
            bool confirm = await Application.Current.MainPage.DisplayAlert(
                "Cerrar sesión", "¿Estás seguro que deseas cerrar sesión?", "Sí", "No");

            if (!confirm) return;

            Preferences.Remove("auth_token");

            // Reiniciar la raíz del Shell para evitar errores
            Application.Current.MainPage = new AppShell();
        }


        // COMANDOS DE NAVEGACIÓN

        [RelayCommand]
        private async Task IrAInformacionPersonal()
        {
            await Shell.Current.GoToAsync(nameof(PersonalDataPage));

        }

        [RelayCommand]
        private async Task IrAMetodosPago()
        {
            await Shell.Current.GoToAsync(nameof(PaymentMethodsPage));

        }

        [RelayCommand]
        private async Task IrAPrivacidad()
        {
            await Shell.Current.GoToAsync(nameof(PrivacidadPage));

        }

        [RelayCommand]
        private async Task IrACentroDeAyuda()
        {
            await Shell.Current.GoToAsync(nameof(CentroAyudaPage));
        }

        [RelayCommand]
        private async Task IrAContacto()
        {
            await Shell.Current.GoToAsync(nameof(ContactoPage));

        }

        [RelayCommand]
        private async Task IrASobre()
        {
            await Shell.Current.GoToAsync(nameof(SobrePage));

        }
    }
}
