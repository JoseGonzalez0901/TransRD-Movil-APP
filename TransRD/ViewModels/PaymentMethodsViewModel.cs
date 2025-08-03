
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;
using System.Text.RegularExpressions;
using CommunityToolkit.Mvvm.Input;
using TransRD.Models;


namespace TransRD.ViewModels
{
    public partial class PaymentMethodsViewModel : ObservableObject
    {
        [ObservableProperty] private ObservableCollection<PaymentMethod> tarjetas;

        [ObservableProperty] private string numeroTarjeta;
        [ObservableProperty] private string fechaExpiracion;
        [ObservableProperty] private string cvv;
        [ObservableProperty] private string apodo;

        [ObservableProperty] private bool esNumeroTarjetaValido = true;
        [ObservableProperty] private bool escvvValido = true;

        public IRelayCommand GuardarCommand { get; }
        public IRelayCommand<PaymentMethod> EditarCommand { get; }
        public IRelayCommand<PaymentMethod> EliminarCommand { get; }

        public PaymentMethodsViewModel()
        {
            Tarjetas = new ObservableCollection<PaymentMethod>
            {
                new PaymentMethod { NumeroTarjeta = "•••• 4532", FechaExpiracion = "12/26", Tipo = "Visa" },
                new PaymentMethod { NumeroTarjeta = "•••• 8901", FechaExpiracion = "09/25", Tipo = "MasterCard" }
            };

            GuardarCommand = new RelayCommand(GuardarMetodo);
            EditarCommand = new RelayCommand<PaymentMethod>(EditarMetodo);
            EliminarCommand = new RelayCommand<PaymentMethod>(EliminarMetodo);
        }

        private void GuardarMetodo()
        {
            EsNumeroTarjetaValido = Regex.IsMatch(NumeroTarjeta ?? "", "^\\d{16}$");
            EscvvValido = Regex.IsMatch(cvv ?? "", "^\\d{3}$");

            if (!EsNumeroTarjetaValido || !EscvvValido)
                return;

            string ultimos4 = NumeroTarjeta.Substring(NumeroTarjeta.Length - 4);
            string tipo = NumeroTarjeta.StartsWith("4") ? "Visa" : "MasterCard";

            Tarjetas.Add(new PaymentMethod
            {
                NumeroTarjeta = $"•••• {ultimos4}",
                FechaExpiracion = FechaExpiracion,
                cvv = cvv,
                Apodo = Apodo,
                Tipo = tipo
            });

            NumeroTarjeta = FechaExpiracion = cvv = Apodo = string.Empty;
        }

        private void EditarMetodo(PaymentMethod metodo)
        {
            // Lógica de edición (ej. abrir formulario con datos actuales)
        }

        private void EliminarMetodo(PaymentMethod metodo)
        {
            if (Tarjetas.Contains(metodo))
                Tarjetas.Remove(metodo);
        }
    }
}
