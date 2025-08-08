using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using TransRD.Models;
using TransRD.Interfaces;
using System.Threading.Tasks;
using TransRD.Views;
using Microsoft.Maui.Storage;

namespace TransRD.ViewModels
{
    public partial class LoginViewModel : ObservableObject
    {
        private readonly IAuthService _authService;
        private string Rol { get; set; } = "Usuario";

        [ObservableProperty]
        private string email;

        [ObservableProperty]
        private string password;

        public LoginViewModel(IAuthService authService)
        {
            _authService = authService;
            MainThread.BeginInvokeOnMainThread(async () => await VerifyTokenAsync());

        }
        private async Task VerifyTokenAsync()
        {
            var token = Preferences.Get("auth_token", string.Empty);
            
            if (!string.IsNullOrEmpty(token))
            {
                // Usuario autenticado → cargar TabBar dinámico y navegar
                await VerifyRolAsync();
            }
        }
        private async Task VerifyRolAsync()
        {
            var rol = Preferences.Get("rol", string.Empty);
            if (!string.IsNullOrEmpty(rol))
            {
                Rol = rol;
                if (Rol == "Admin")
                {
                    ShellNavigationHelper.CargarTabarAdmin();
                    await Shell.Current.GoToAsync(nameof(AdminDashboardPage));
                }
                else
                {
                    ShellNavigationHelper.CargarTabBarPrincipal();
                    await Shell.Current.GoToAsync(nameof(HomePage));
                }
            }
        }
        [RelayCommand]
        private async Task LoginAsync()
        {
            if (string.IsNullOrWhiteSpace(Email) || string.IsNullOrWhiteSpace(Password))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Todos los campos son obligatorios.", "OK");
                return;
            }

            try
            {
                var request = new LoginRequest
                {
                    Email = Email,
                    Password = Password,
                    
                };

                var response = await _authService.LoginAsync(request);

                // Guardar token local si es necesario
                if (!string.IsNullOrWhiteSpace(response.Token))
                {

                    // Puedes guardarlo en Preferences si deseas
                    Preferences.Set("auth_token", response.Token);

                    Preferences.Set("user_id", response.UserId);

                    if (!string.IsNullOrWhiteSpace(response.Rol))
                    {
                        Preferences.Set("rol", response.Rol);
                    }
                    else
                    {
                        Preferences.Set("rol", "Usuario");

                    }

                    await VerifyRolAsync();

                }
                else
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Error al iniciar sesion", "OK");
                }
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"Error al iniciar sesión", "OK");
            }
        }

        [RelayCommand]
        private async Task NavigateToRegisterAsync()
        {
            await Shell.Current.GoToAsync(nameof(RegisterPage));

        }

        [RelayCommand]
        private async Task NavigateToResetPasswordAsync()
        {
            await Shell.Current.GoToAsync(nameof(RecuperarClavePage));
        }
    }
}
