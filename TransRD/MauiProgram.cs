using Microsoft.Extensions.Logging;
using Microsoft.Maui.Controls.Compatibility.Hosting;
using Microsoft.Maui;
using Microsoft.Maui.Controls.Hosting;
using Microsoft.Maui.Hosting;
using SkiaSharp.Views.Maui.Controls.Hosting;
using TransRD.Interfaces;
//using TransRD.Service;
using TransRD.ViewModels;
using TransRD.Views;
using System.Net.Http;

namespace TransRD
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
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
                httpClient.BaseAddress = new Uri("http://10.0.0.9:5203/swagger");

                return new AuthService(httpClient);
            });

            // Registrar VM y Pages
            builder.Services.AddTransient<LoginViewModel>();
            builder.Services.AddTransient<LoginPage>();

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
