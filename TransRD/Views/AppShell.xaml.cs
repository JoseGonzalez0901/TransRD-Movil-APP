using TransRD.Views;
using Microsoft.Maui.Storage;
using TransRD.Models;

namespace TransRD;

public partial class AppShell : Shell
{
    public AppShell()
    {
        InitializeComponent();

        // Registro de rutas Usuario
        Routing.RegisterRoute(nameof(HomePage), typeof(HomePage));
        Routing.RegisterRoute(nameof(LoginPage), typeof(LoginPage));
        Routing.RegisterRoute(nameof(RegisterPage), typeof(RegisterPage));
        Routing.RegisterRoute(nameof(RecuperarClavePage), typeof(RecuperarClavePage));
        Routing.RegisterRoute(nameof(PersonalDataPage), typeof(PersonalDataPage));
        Routing.RegisterRoute(nameof(PaymentMethodsPage), typeof(PaymentMethodsPage));
        Routing.RegisterRoute(nameof(PrivacidadPage), typeof(PrivacidadPage));
        Routing.RegisterRoute(nameof(CentroAyudaPage), typeof(CentroAyudaPage));
        Routing.RegisterRoute(nameof(ContactoPage), typeof(ContactoPage));
        Routing.RegisterRoute(nameof(SobrePage), typeof(SobrePage));
        Routing.RegisterRoute(nameof(ReportarProblemaPage), typeof(ReportarProblemaPage));

        //Registro de rutas Admin

        Routing.RegisterRoute(nameof(AdminDashboardPage), typeof(AdminDashboardPage));
        Routing.RegisterRoute(nameof(AgregarRutaPage), typeof(AgregarRutaPage));
        Routing.RegisterRoute(nameof(ReportesPage), typeof(ReportesPage));


        // Llamada diferida para navegación segura
        // MainThread.BeginInvokeOnMainThread(async () => await VerifyTokenAsync());
    }

   
}
