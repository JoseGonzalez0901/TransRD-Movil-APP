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
                ShellNavigationHelper.CargarTabBarPrincipal();
                await Shell.Current.GoToAsync(nameof(HomePage)); // uso de ruta absoluta
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
                    Password = Password
                };

                var response = await _authService.LoginAsync(request);

                // Guardar token local si es necesario
                if (!string.IsNullOrWhiteSpace(response.Token))
                {
                    // Puedes guardarlo en Preferences si deseas
                    Preferences.Set("auth_token", response.Token);

                    //await Application.Current.MainPage.DisplayAlert("Bienvenido", $"Hola {response.UserName}", "OK");
                    ShellNavigationHelper.CargarTabBarPrincipal();
                    await Shell.Current.GoToAsync(nameof(HomePage));

                }
                else
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Token inválido en respuesta", "OK");
                }
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"Error al iniciar sesión: {ex.Message}", "OK");
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
