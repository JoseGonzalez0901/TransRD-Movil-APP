namespace TransRD;

public partial class AppShell : Shell
{
    public AppShell()
    {
        InitializeComponent();

        Routing.RegisterRoute("inicio", typeof(Views.HomePage));
       // Routing.RegisterRoute("rutas", typeof(Views.RutasPage));
        //Routing.RegisterRoute("historial", typeof(Views.HistorialPage));
        Routing.RegisterRoute("perfil", typeof(Views.PerfilPage));
    }
}

