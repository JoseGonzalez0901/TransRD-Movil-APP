using Mapsui.UI.Maui;
using Mapsui.Projections;
using BruTile.Predefined;
using BruTile.Web;
using Mapsui.Tiling.Layers;
using Mapsui.Extensions; // Puede que sea necesario instalar Mapsui.Extensions
using Mapsui.Tiling;
using Mapsui.Widgets.Zoom;
using Mapsui;
using System.Diagnostics;
using Mapsui.UI;
using Mapsui.Styles;
using Mapsui.Layers;
using Mapsui.Providers;
using Mapsui.Styles;
using Mapsui.UI.Maui;
using Mapsui.Utilities;
using NetTopologySuite.Features;
using System.Drawing;

namespace TransRD.Controls;

public partial class Mapcontrol : ContentView
{
    public MapControl Map => MyMap;

    public Mapcontrol()
    {
        InitializeComponent();
        Loaded += Mapcontrol_Loaded;

        MyMap.Map.Widgets.Clear();

    }

    private async void Mapcontrol_Loaded(object sender, EventArgs e)
    {
        if (MyMap != null)
        { 
            // Configurar capa de tiles (OpenStreetMap)
            var tileSource = new HttpTileSource(new GlobalSphericalMercator(),
                "https://tile.openstreetmap.org/{z}/{x}/{y}.png", name: "OSM");

            var tileLayer = new TileLayer(tileSource)
            {
                Name = "OpenStreetMap"
            };

            MyMap.Map?.Layers.Add(tileLayer);

            // Centrar el mapa en RD
            var myLocation = await GetMyLocationAsync(); // ✅ no bloquea la UI
            MyMap.MyLocationLayer.UpdateMyLocation(myLocation, true);
           
        }
    }
    private void GoToLocation(double lon, double lat, double zoomLevel = 10000)
    {
       Position position = new Position(lat, lon);

        MyMap.Map.Navigator.CenterOnAndZoomTo(new Position(position.Latitude, position.Longitude).ToMapsui(), 1000);
    }
    private async void OnCenterLocationClicked(object sender, EventArgs e)
    {
        var myLocation = await GetMyLocationAsync();
        GoToLocation(myLocation.Longitude, myLocation.Latitude, 10);
    }
    private static async Task<Position> GetMyLocationAsync()
    {
        try
        {
            var location = await Geolocation.GetLocationAsync(new GeolocationRequest
            {
                DesiredAccuracy = GeolocationAccuracy.Best,
                Timeout = TimeSpan.FromSeconds(30)
            });

            if (location == null)
                return new Position(0, 0);

            return (new Position(location.Latitude, location.Longitude));
        }
        catch (Exception ex)
        {
            Debug.WriteLine($"Error al obtener la ubicación: {ex.Message}");
            return new Position(0, 0);
        }
    }

}
