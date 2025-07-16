using System.Collections.ObjectModel;
using Microsoft.Maui.Graphics;
using TransRD.Models;
namespace TransRD.ViewModels
{
    public class HomeViewModel
    {
        public ObservableCollection<Route> AvailableRoutes { get; set; }

        public HomeViewModel()
        {
            AvailableRoutes = new ObservableCollection<Route>
            {
                new Route
                {
                    Line = "Línea 1 - Centro",
                    Time = "10 min · 3 paradas",
                    Status = "A tiempo",
                    StatusColor = Colors.Green,
                    Icon= "train_white_icon.png"
                },
                new Route
                {
                    Line = "Línea 2 - Pedro Mir",
                    Time = "22 min · 8 paradas",
                    Status = "5 min de retraso",
                    StatusColor = Colors.Red,
                    Icon= "train_white_icon.png"

                },
                new Route
                {
                    Line = "Línea 1 - Casandra Damirón",
                    Time = "35 min · 10 paradas",
                    Status = "A tiempo",
                    StatusColor = Colors.Green,
                    Icon= "train_white_icon.png"

                }
            };
        }
    }


}
