using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using TransRD.Models;
using TransRD.Views;
using TransRD.Interfaces;
using static Microsoft.Maui.ApplicationModel.Permissions;

namespace TransRD.ViewModels
{
    public partial class RegisterViewModel : ObservableObject
    {
        private readonly IAuthService _authService;

        [ObservableProperty]
        private string fullName;

        [ObservableProperty]
        private string email;

        [ObservableProperty]
        private string password;

        [ObservableProperty]
        private string confirmPassword;

        [ObservableProperty]
        private bool acceptTerms;

        public RegisterViewModel(IAuthService authService)
        {
            _authService = authService;
        }

        [RelayCommand]
        private async Task RegisterAsync()
        {
            if (string.IsNullOrWhiteSpace(FullName) ||
                string.IsNullOrWhiteSpace(Email) ||
                string.IsNullOrWhiteSpace(Password) ||
                string.IsNullOrWhiteSpace(ConfirmPassword)) 
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Por favor completa todos los campos.", "OK");
                return;
            }

            if (Password != ConfirmPassword)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Las contraseñas no coinciden.", "OK");
                return;
            }

            if (!AcceptTerms)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Debes aceptar los términos y condiciones.", "OK");
                return;
            }

            try
            {
                var request = new RegisterRequest
                {
                    Username = FullName,
                    Email = Email,
                    NumberPhone = "Phone",
                    Password = Password,
                    DateCreation= DateTime.UtcNow,
                    Status = "Activo",
                    Rol = "User" // Asignar un rol por defecto, puede ser "Admin" o "User"
                };

                var result = await _authService.RegisterAsync(request);

                await Application.Current.MainPage.DisplayAlert("Éxito", "Usuario registrado correctamente.", "OK");
                await Shell.Current.GoToAsync(nameof(LoginPage));
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"Error al registrar: {ex.Message}", "OK");
            }
        }

        [RelayCommand]
        private async Task NavigateToLoginAsync()
        {
            await Shell.Current.GoToAsync(nameof(LoginPage));
        }
    }
}
