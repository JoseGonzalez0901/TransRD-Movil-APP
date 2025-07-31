using TransRD.ViewModels;
using TransRD.Views;

namespace TransRD
{
    public partial class App : Application
    {
        public App(ReportarProblemaPage homePage)
        {
            InitializeComponent();

            // Mostrar página de login
            //MainPage = new NavigationPage(loginPage);

            MainPage = new NavigationPage(homePage);


        }
    }
}
