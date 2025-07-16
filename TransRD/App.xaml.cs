using TransRD.Views;

namespace TransRD
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            MainPage = new NavigationPage(new HomePage())
            {
                BarBackgroundColor = Colors.LightGray,
                BarTextColor = Colors.Black
            };
        }

       /* protected override Window CreateWindow(IActivationState? activationState)
        {
            return new Window(new LoginPage());
        }*/
    }
}