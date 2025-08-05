namespace TransRD.Views;

public partial class CentroAyudaPage : ContentPage
{
	public CentroAyudaPage()
	{
		InitializeComponent();
        Shell.SetBackButtonBehavior(this, new BackButtonBehavior { IsEnabled = true });
    }
}