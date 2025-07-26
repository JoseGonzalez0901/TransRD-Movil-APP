using Microsoft.Extensions.Logging;
using Microsoft.Maui.Controls.Compatibility.Hosting; // necesario para UseMauiMaps()
using Microsoft.Maui;
using Microsoft.Maui.Controls.Hosting;
using Microsoft.Maui.Hosting;
using SkiaSharp.Views.Maui.Controls.Hosting;
namespace TransRD
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            // Without the UseSkiaSharp(true) line below the app will crash with this exception:
            // "Catastrophic failure (0x8000FFFF (E_UNEXPECTED))".
            // and without the 'true' parameter Android will crash with this exception:
            // "Microsoft.Maui.Platform.HandlerNotFoundException: 'Handler not found for view SkiaSharp.Views.Maui.Controls.SKGLView.'"
            builder
                .UseMauiApp<App>()
                .UseSkiaSharp()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });




            return builder.Build();
        }
    }
}
