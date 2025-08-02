using System.Collections.ObjectModel;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;

namespace TransRD.ViewModels
{
    public partial class AgregarRutaViewModel : ObservableObject
    {
        [ObservableProperty]
        private string nombreRuta;

        [ObservableProperty]
        private string origen;

        [ObservableProperty]
        private string destino;

        [ObservableProperty]
        private int paradas;

        [ObservableProperty]
        private string horario;

        [ObservableProperty]
        private string estado;

        [ObservableProperty]
        private ObservableCollection<string> placas = new()
        {
            "A695142",
            "A621663",
            "A516512",
            "A215663"
        };

        [RelayCommand]
        private async Task GuardarRutaAsync()
        {
            // Aquí podrías validar o guardar los datos
            await Application.Current.MainPage.DisplayAlert("Ruta Guardada", "Los datos fueron almacenados correctamente", "OK");

            // Ejemplo de limpieza opcional:
            NombreRuta = string.Empty;
            Origen = string.Empty;
            Destino = string.Empty;
            Paradas = 0;
            Horario = string.Empty;
            Estado = string.Empty;
            Placas.Clear();
        }
    }
}
