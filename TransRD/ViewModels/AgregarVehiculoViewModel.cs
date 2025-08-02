using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;

namespace TransRD.ViewModels
{
    public partial class AgregarVehiculoViewModel : ObservableObject
    {
        [ObservableProperty]
        private string marca;

        [ObservableProperty]
        private string modelo;

        [ObservableProperty]
        private string ano;

        [ObservableProperty]
        private string tipoVehiculo;

        [ObservableProperty]
        private string cantidadAsientos;

        [ObservableProperty]
        private string placa;

        public AgregarVehiculoViewModel()
        {
            // Valores por defecto si se desea
            Marca = "Toyota";
            Modelo = "Corolla";
            Ano = "2015";
            TipoVehiculo = "Carro público";
            CantidadAsientos = "5";
            Placa = "A123456";
        }

        [RelayCommand]
        private async Task GuardarVehiculoAsync()
        {
            // Aquí puedes guardar en la base de datos, llamar un servicio, etc.
            await Application.Current.MainPage.DisplayAlert("Éxito", "Vehículo guardado correctamente", "OK");

            // Reset opcional
            Marca = string.Empty;
            Modelo = string.Empty;
            Ano = string.Empty;
            TipoVehiculo = string.Empty;
            CantidadAsientos = string.Empty;
            Placa = string.Empty;
        }
    }
}