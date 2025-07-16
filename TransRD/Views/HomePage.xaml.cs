namespace TransRD.Views;

public partial class HomePage : ContentPage
{
	public HomePage()
	{
		InitializeComponent();
		BindingContext=new ViewModels.HomeViewModel();
	}
}