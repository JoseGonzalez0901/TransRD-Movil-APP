namespace TransRD.Views;

public partial class HomePage1 : ContentPage
{
	public HomePage1()
	{
		InitializeComponent();
	}
    protected override void OnAppearing()
    {
        base.OnAppearing();
        if (Application.Current.MainPage is AppShell shell)
        {
            shell.SetActiveTab("inicio"); // según la página actual
        }

    }
}