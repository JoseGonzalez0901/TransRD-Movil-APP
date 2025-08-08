using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransRD.Models
{
    public partial class RutaItem : ObservableObject
    {
        public string Id { get; set; } = string.Empty;

        [ObservableProperty] string nombre = "";
        [ObservableProperty] string subtitulo = "";
        [ObservableProperty] string icon = "ic_bus.png";
        [ObservableProperty] Color iconBg = Colors.LightGray;

        // Para pintar el separador superior (igual que en la maqueta)
        [ObservableProperty] bool showTopDivider;
    }
}
