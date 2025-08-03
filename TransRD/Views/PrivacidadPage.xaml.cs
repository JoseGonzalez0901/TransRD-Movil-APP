using TransRD.ViewModels;

namespace TransRD.Views;

public partial class PrivacidadPage : ContentPage
{
	public PrivacidadPage()
	{
		InitializeComponent();
        BindingContext = new PrivacidadViewModel();
    }
}