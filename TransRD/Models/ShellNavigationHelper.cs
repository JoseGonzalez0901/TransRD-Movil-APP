using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransRD.Views;

namespace TransRD.Models
{
    public static class ShellNavigationHelper
    {
        public static void CargarTabBarPrincipal()
        {
            var appShell = AppShell.Current;

            appShell.Items.Clear();

            var tabBar = new TabBar();

            tabBar.Items.Add(new ShellContent
            {
                Title = "Inicio",
                Icon = "inicio.png",
                Route = "inicio",
                ContentTemplate = new DataTemplate(typeof(HomePage))
            });

            tabBar.Items.Add(new ShellContent
            {
                Title = "Rutas",
                Icon = "rutas.png",
                Route = "rutas",
                ContentTemplate = new DataTemplate(typeof(RoutesPage))
            });

            tabBar.Items.Add(new ShellContent
            {
                Title = "Historial",
                Icon = "historial.png",
                Route = "historial",
                ContentTemplate = new DataTemplate(typeof(HistorialPage))
            });

            tabBar.Items.Add(new ShellContent
            {
                Title = "Perfil",
                Icon = "perfil.png",
                Route = "perfil",
                ContentTemplate = new DataTemplate(typeof(PerfilPage))
            });

            appShell.Items.Add(tabBar);
        }
    }

}
