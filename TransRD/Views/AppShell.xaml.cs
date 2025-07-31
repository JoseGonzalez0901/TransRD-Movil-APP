using TransRD.Views;

namespace TransRD;


    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute("login", typeof(LoginPage));
            Routing.RegisterRoute("inicio", typeof(Homepage));
            Routing.RegisterRoute("rutas", typeof(RoutesPage));
            Routing.RegisterRoute("historial", typeof(HistorialPage));
            Routing.RegisterRoute("perfil", typeof(PerfilPage));
            


    }
    private async void GoToStartPage()
    {
        // Esperar a que Shell esté completamente cargado
        await Task.Delay(100); // opcional pero útil en Android/iOS

        await Shell.Current.GoToAsync("/login");
    }

    public void SetActiveTab(string route)
    {
        foreach (var section in MainTabBar.Items)
        {
            if (section is ShellSection shellSection)
            {
                foreach (var tab in shellSection.Items)
                {
                    switch (tab.Route)
                    {
                        case "inicio":
                            tab.Icon = route == "inicio" ? "inicio_activo.png" : "inicio.png";
                            break;
                        case "rutas":
                            tab.Icon = route == "rutas" ? "rutas_activo.png" : "rutas.png";
                            break;
                        case "historial":
                            tab.Icon = route == "historial" ? "historial_activo.png" : "historial.png";
                            break;
                        case "perfil":
                            tab.Icon = route == "perfil" ? "perfil_activo.png" : "perfil.png";
                            break;
                    }
                }
            }
        }
    }

}



