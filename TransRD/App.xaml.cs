using TransRD.Views;

namespace TransRD
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new AppShell();

        }
        private async void GoToStartPage()
        {
            // Esperar a que Shell esté completamente cargado
            await Task.Delay(100); // opcional pero útil en Android/iOS

            await Shell.Current.GoToAsync("///inicio");
        }
    }

}