using TransRD.Views;

namespace TransRD;


    public partial class AppShell : Shell
    {
    public AppShell()
    {
        InitializeComponent();

        Routing.RegisterRoute(nameof(HomePage), typeof(HomePage));
        Routing.RegisterRoute(nameof(LoginPage), typeof(LoginPage));
        Routing.RegisterRoute(nameof(RegisterPage), typeof(RegisterPage));
        Routing.RegisterRoute(nameof(PerfilPage), typeof(PerfilPage));
        Routing.RegisterRoute(nameof(PersonalDataPage), typeof(PersonalDataPage));
        Routing.RegisterRoute(nameof(PrivacidadPage), typeof(PrivacidadPage));
        Routing.RegisterRoute(nameof(RecuperarClavePage), typeof(RecuperarClavePage));
        Routing.RegisterRoute(nameof(AgregarVehiculoPage), typeof(AgregarVehiculoPage));
        Routing.RegisterRoute(nameof(AgregarRutaPage), typeof(AgregarRutaPage));
        Routing.RegisterRoute(nameof(ModificarRutaPage), typeof(ModificarRutaPage));
        Routing.RegisterRoute(nameof(RoutesPage), typeof(RoutesPage));
        Routing.RegisterRoute(nameof(ReportarProblemaPage), typeof(ReportarProblemaPage));
        Routing.RegisterRoute(nameof(ReportesPage), typeof(ReportesPage));
        Routing.RegisterRoute(nameof(PaymentMethodsPage), typeof(PaymentMethodsPage));
        Routing.RegisterRoute(nameof(AdminDashboardPage), typeof(AdminDashboardPage));
        Routing.RegisterRoute(nameof(HistorialPage), typeof(HistorialPage));
    

    /*
        Routing.RegisterRoute("login", typeof(LoginPage));
        Routing.RegisterRoute("inicio", typeof(Homepage));
        Routing.RegisterRoute("rutas", typeof(RoutesPage));
        Routing.RegisterRoute("historial", typeof(HistorialPage));
        Routing.RegisterRoute("perfil", typeof(PerfilPage));

    */

}

    /*
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
    */

}



