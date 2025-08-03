namespace TransRD.Models
{
    public class PaymentMethod
    {
        public string NumeroTarjeta { get; set; }
        public string FechaExpiracion { get; set; }
        public string cvv { get; set; }
        public string Apodo { get; set; }
        public string Tipo { get; set; } // Visa, MasterCard, etc.
    }
}
