using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransRD.Models;
using TransRD.Views;
namespace TransRD.ViewModels
{
    public partial class RecuperarClaveViewModel : ObservableObject
    {
        [ObservableProperty]
        private string mail;


        [RelayCommand]
        private async Task SendResetAsync()
        {
            if (string.IsNullOrWhiteSpace(Mail))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Por favor ingresa tu correo electrónico.", "OK");
                return;
            }

            // Aquí iría la lógica real para enviar el enlace de recuperación
            await Application.Current.MainPage.DisplayAlert("Enlace Enviado", "Revisa tu correo para restablecer tu contraseña.", "OK");
            await Shell.Current.GoToAsync(nameof(LoginPage));

        }

        [RelayCommand]
        private async Task NavigateToLoginAsync()
        {
            await Shell.Current.GoToAsync(nameof(LoginPage));

        }
    }

}
