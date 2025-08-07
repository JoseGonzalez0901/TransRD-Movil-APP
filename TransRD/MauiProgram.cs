using Microsoft.Extensions.Logging;
using Microsoft.Maui.Controls.Compatibility.Hosting;
using Microsoft.Maui;
using Microsoft.Maui.Controls.Hosting;
using Microsoft.Maui.Hosting;
using SkiaSharp.Views.Maui.Controls.Hosting;
using TransRD.Interfaces;
using TransRD.Service;
using TransRD.ViewModels;
using TransRD.Views;
using System.Net.Http;


namespace TransRD
{

    
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            string IP = "http://10.135.184.26:5203/"; // Cambia por tu IP/API real
            var builder = MauiApp.CreateBuilder();

            builder
                .UseMauiApp<App>() // DI para App
                .UseSkiaSharp()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

            // Registrar AuthService con HttpClient
            builder.Services.AddScoped<IAuthService, AuthService>(provider =>
            {
                var handler = new HttpClientHandler();

#if ANDROID
    handler.ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;
#endif

                var httpClient = new HttpClient(handler);

                // ✅ AQUÍ es donde debes colocar la línea:
                httpClient.BaseAddress = new Uri(IP);

                return new AuthService(httpClient);
            });
            builder.Services.AddScoped<IPerfilService, PerfilService>(provider =>
            {
                var handler = new HttpClientHandler();

#if ANDROID
    handler.ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;
#endif

                var httpClient = new HttpClient(handler);
                httpClient.BaseAddress = new Uri(IP);

                return new PerfilService(httpClient);
            });


            builder.Services.AddScoped<ProblemaService>(provider =>
            {
                var handler = new HttpClientHandler();

#if ANDROID
    handler.ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;
#endif

                var httpClient = new HttpClient(handler);
                httpClient.BaseAddress = new Uri(IP); // Cambia por tu IP/API real

                return new ProblemaService(httpClient);
            });


            builder.Services.AddScoped<ViajesService>(provider =>
            {
                var handler = new HttpClientHandler();

#if ANDROID
    handler.ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;
#endif

                var httpClient = new HttpClient(handler);
                httpClient.BaseAddress = new Uri(IP); // Igual que arriba

                return new ViajesService(httpClient);
            });


            // Registrar VM y Pages
            builder.Services.AddTransient<LoginViewModel>();
            builder.Services.AddTransient<LoginPage>();

            builder.Services.AddTransient<PerfilViewModel>();
            builder.Services.AddTransient<PerfilPage>();

            builder.Services.AddTransient<RegisterViewModel>();
            builder.Services.AddTransient<RegisterPage>();

            builder.Services.AddTransient<PersonalDataViewModel>();
            builder.Services.AddTransient<PersonalDataPage>();

            builder.Services.AddTransient<ReportarProblemaViewModel>();
            builder.Services.AddTransient<ReportarProblemaPage>();

            builder.Services.AddTransient<HomeViewModel>();
            builder.Services.AddTransient<HomePage>();

            builder.Services.AddTransient<RoutesViewModel>();
            builder.Services.AddTransient<RoutesPage>();
            

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
