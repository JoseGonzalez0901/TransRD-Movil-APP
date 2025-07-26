using Microsoft.Maui.Controls;
using TransRD.Controls;

namespace TransRD.Views;

public partial class HomePage : ContentPage
{
    public HomePage()
    {
        InitializeComponent();

        BindingContext = new ViewModels.HomeViewModel();

        // Asegura que el mapa se inicialice correctamente si necesitas personalización
        var map = MyMapControl.Map;

        // Si usas MapControl de MapsUI y necesitas configurar el zoom o posición inicial:
        // map.Navigator.ZoomTo(1000, Mapsui.Utilities.AnimationLevel.None);
        // map.Navigator.CenterOn(new Mapsui.Geometries.Point(-69.9, 18.5)); // ejemplo: Santo Domingo
    }
}
