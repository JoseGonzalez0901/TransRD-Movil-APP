// LoginViewModel.cs
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using TransRD.Models;

namespace TransRD.ViewModels
{
    public partial class LoginViewModel : ObservableObject
    {
        [ObservableProperty]
        private string email;

        [ObservableProperty]
        private string password;

        public LoginViewModel()
        {
            // Constructor
        }

        [RelayCommand]
        private async Task LoginAsync()
        {
            if (string.IsNullOrWhiteSpace(Email) || string.IsNullOrWhiteSpace(Password))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Todos los campos son obligatorios.", "OK");
                return;
            }

            // Autenticación simulada
            if (Email == "admin@admin.com" && Password == "1234")
            {
                await Application.Current.MainPage.DisplayAlert("Bienvenido", "Inicio de sesión exitoso", "OK");
                Navigate.NavigateToPage(new Views.HomePage(), false);
                // Navegar a la página principal
            }
            else
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Credenciales inválidas", "OK");
            }
        }

        [RelayCommand]
        private async Task NavigateToRegisterAsync()
        {
            Navigate.NavigateToPage(new Views.RegisterPage(),false);
           

        }

        [RelayCommand]
        private async Task NavigateToResetPasswordAsync()
        {
           Navigate.NavigateToPage(new Views.RecuperarClavePage(),true);
        }
    }
}
