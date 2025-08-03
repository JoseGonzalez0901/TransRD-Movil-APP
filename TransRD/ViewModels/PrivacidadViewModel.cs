using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;
using System.Windows.Input;

namespace TransRD.ViewModels
{
    public partial class PrivacidadViewModel : ObservableObject
    {
        [ObservableProperty]
        private string nombre = "María González";

        [ObservableProperty]
        private string correo = "maria.gonzalez@email.com";

        [ObservableProperty]
        private string avatar = "avatar_demo.png";

        // COMANDOS

        [RelayCommand]
        private async Task CompartirUbicacion()
        {
            await Shell.Current.DisplayAlert("Ubicación", "Compartiendo ubicación del dispositivo...", "OK");
        }

        [RelayCommand]
        private async Task CompartirUbicacionTiempoReal()
        {
            await Shell.Current.DisplayAlert("Ubicación", "Compartiendo ubicación en tiempo real...", "OK");
        }

        [RelayCommand]
        private async Task ConfigurarMfa()
        {
            await Shell.Current.DisplayAlert("Seguridad", "Configurando autenticación multifactor...", "OK");
        }

        [RelayCommand]
        private async Task OcultarDatos()
        {
            await Shell.Current.DisplayAlert("Privacidad", "Datos personales ocultos exitosamente.", "OK");
        }

        [RelayCommand]
        private async Task EliminarCuenta()
        {
            bool confirm = await Shell.Current.DisplayAlert("Eliminar cuenta", "¿Estás seguro de eliminar tu cuenta?", "Sí", "Cancelar");
            if (confirm)
            {
                await Shell.Current.DisplayAlert("Cuenta eliminada", "Tu cuenta ha sido eliminada.", "OK");
                // Aquí podrías cerrar sesión o redirigir a login
            }
        }

        [RelayCommand]
        private async Task GuardarCambios()
        {
            await Shell.Current.DisplayAlert("Privacidad", "Cambios guardados correctamente", "OK");
        }
    }
}
