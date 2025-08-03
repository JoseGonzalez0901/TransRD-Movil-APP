using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;
using System.Threading.Tasks;

namespace TransRD.ViewModels
{
    public partial class ModificarRutaViewModel : ObservableObject
    {
        [ObservableProperty]
        private string nombreRuta = "OMSA Ruta 10";

        [ObservableProperty]
        private string origen = "Av. Máximo Gómez";

        [ObservableProperty]
        private string destino = "Av. George Washington";

        [ObservableProperty]
        private string paradas = "7";

        [ObservableProperty]
        private string horario = "8:00 a.m. - 7:00 p.m.";

        [ObservableProperty]
        private string estado = "Activa";

        [ObservableProperty]
        private ObservableCollection<string> placas = new()
        {
            "A695142",
            "A621663",
            "A516512",
            "A215663"
        };

        [RelayCommand]
        private async Task GuardarAsync()
        {
            // Aquí podrías hacer una llamada a un servicio o guardar en base de datos
            await Application.Current.MainPage.DisplayAlert("Ruta", "Ruta guardada correctamente", "OK");
        }
    }
}
