
using Microsoft.Maui.Controls;
using TransRD.Controls;
using TransRD.ViewModels;

namespace TransRD.Views;

public partial class RoutesPage : ContentPage
{
    private bool _isFirstLoad = true;

    public RoutesPage()
    {
        InitializeComponent();
        BindingContext = new RoutesViewModel();
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        if (_isFirstLoad)
        {
            _isFirstLoad = false;

            if (BindingContext is RoutesViewModel vm)
                await vm.LoadAsync();

            var map = MyMapControl.Map;

            // Opcional: configuración inicial del mapa
            // map.Navigator.CenterOn(new Mapsui.Geometries.Point(-69.9, 18.5));
            // map.Navigator.ZoomTo(1000, Mapsui.Utilities.AnimationLevel.None);
        }
    }
}