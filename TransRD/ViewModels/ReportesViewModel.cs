using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microcharts;
using SkiaSharp;
using System.Collections.Generic;

namespace TransRD.ViewModels
{
    public partial class ReportesViewModel : ObservableObject
    {
        [ObservableProperty] private Chart chart;
        [ObservableProperty] private int vehiculosActivos;
        [ObservableProperty] private int vehiculosInactivos;
        [ObservableProperty] private int rutasActivas;
        [ObservableProperty] private int rutasInactivas;
        [ObservableProperty] private int usuariosActivos;
        [ObservableProperty] private string selectedCategory = "Vehículos";

        public IRelayCommand<string> CambiarCategoriaCommand { get; }

        public ReportesViewModel()
        {
            CambiarCategoriaCommand = new RelayCommand<string>(categoria => SelectedCategory = categoria);

            VehiculosActivos = 847;
            VehiculosInactivos = 45;
            RutasActivas = 847;
            RutasInactivas = 20;
            UsuariosActivos = 12500;

            SelectedCategory = "Vehículos";
        }

        partial void OnSelectedCategoryChanged(string value)
        {
            switch (value)
            {
                case "Vehículos":
                    int totalVeh = VehiculosActivos + VehiculosInactivos;
                    Chart = new PieChart
                    {
                        Entries = new[]
                        {
                            new ChartEntry(VehiculosActivos)
                            {
                                Label = "Activos",
                                ValueLabel = $"{(VehiculosActivos * 100 / totalVeh)}%",
                                Color = SKColor.Parse("#2563EB")
                            },
                            new ChartEntry(VehiculosInactivos)
                            {
                                Label = "Inactivos",
                                ValueLabel = $"{(VehiculosInactivos * 100 / totalVeh)}%",
                                Color = SKColor.Parse("#EF4444")
                            }
                        },
                        LabelTextSize = 32,
                        HoleRadius = 0.6f
                    };
                    break;

                case "Rutas":
                    int totalRutas = RutasActivas + RutasInactivas;
                    Chart = new PieChart
                    {
                        Entries = new[]
                        {
                            new ChartEntry(RutasActivas)
                            {
                                Label = "Activas",
                                ValueLabel = $"{(RutasActivas * 100 / totalRutas)}%",
                                Color = SKColor.Parse("#FB923C")
                            },
                            new ChartEntry(RutasInactivas)
                            {
                                Label = "Inactivas",
                                ValueLabel = $"{(RutasInactivas * 100 / totalRutas)}%",
                                Color = SKColor.Parse("#EF4444")
                            }
                        },
                        LabelTextSize = 32,
                        HoleRadius = 0.6f
                    };
                    break;

                case "Usuarios":
                    Chart = new PieChart
                    {
                        Entries = new[]
                        {
                            new ChartEntry(UsuariosActivos)
                            {
                                Label = "Activos",
                                ValueLabel = "100%", // Solo muestra activos
                                Color = SKColor.Parse("#16A34A")
                            }
                        },
                        LabelTextSize = 32,
                        HoleRadius = 0.6f
                    };
                    break;
            }
        }
    }
}
