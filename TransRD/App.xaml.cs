using TransRD.ViewModels;
using TransRD.Views;

namespace TransRD
{
    public partial class App : Application
    {
        public App(LoginPage loginPage)
        {
            InitializeComponent();

            // Mostrar página de login
            MainPage = new NavigationPage(loginPage);
        }
    }
}
