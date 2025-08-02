using Microcharts;
using SkiaSharp;
using Entry = Microcharts.ChartEntry;

namespace TransRD.Views;
public partial class ReportesPage : ContentPage
{
    public ReportesPage()
    {
        InitializeComponent();

        var entries = new[]
        {
            new Entry(200) { Label = "Ene", ValueLabel = "200", Color = SKColor.Parse("#FF0000") },
            new Entry(250) { Label = "Feb", ValueLabel = "250", Color = SKColor.Parse("#FF0000") },
            new Entry(500) { Label = "Mar", ValueLabel = "500", Color = SKColor.Parse("#FF0000") },
            // Agrega más entradas según lo necesites
        };

        Chart.Chart = new LineChart
        {
            Entries = entries,
            LineMode = LineMode.Straight,
            LineSize = 4,
            PointMode = PointMode.Circle,
            PointSize = 8,
            BackgroundColor = SKColors.Transparent
        };
    }
}
