using TransRD.ViewModels;
using TransRD.Views;

namespace TransRD
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            // Mostrar página de login
            //MainPage = new NavigationPage(loginPage);

            // MainPage = new NavigationPage(homePage);

            MainPage = new AppShell(); // Aquí estableces tu navegación principal




        }
    }
}
