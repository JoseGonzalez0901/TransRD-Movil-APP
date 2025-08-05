using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using TransRD.Models;
using System;
using TransRD.Interfaces;
using TransRD.Models.Usuarios_Model;
using System.Diagnostics;
namespace TransRD.ViewModels
{
    public partial class PersonalDataViewModel : ObservableObject
    {
        [ObservableProperty]
        private bool notificacionesPush;

        [ObservableProperty]
        private bool alertasRetraso;

        [ObservableProperty]
        private bool actualizacionesRuta;

        [ObservableProperty]
        private string nombre;

        [ObservableProperty]
        private string correo;

        [ObservableProperty]
        private string telefono;

        [ObservableProperty]
        private DateTime fechaNacimiento;
        private readonly IPerfilService _perfilService;
        public PersonalDataViewModel(IPerfilService perfilService)
        {
            _perfilService = perfilService;

            CargarPerfil();

        }
        public async Task CargarPerfil()
        {
            try
            {
                var usuario = await _perfilService.ObtenerPerfilAsync();

                if (usuario != null)
                {
                    Nombre = usuario.Nombre;
                    Correo = usuario.Email;
                    Telefono = usuario.Telefono;
                    
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error al cargar el perfil: {ex.Message}");
            }
        }

        [RelayCommand]
        private async Task GuardarCambios()
        {
            // Aquí deberías enviar los datos a tu API real
            await Application.Current.MainPage.DisplayAlert("Guardado", "Tus datos han sido actualizados.", "OK");
        }
    }
}
