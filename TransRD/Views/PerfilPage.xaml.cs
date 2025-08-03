using TransRD.ViewModels;

namespace TransRD.Views;

public partial class PerfilPage : ContentPage
{
	public PerfilPage()
	{
		InitializeComponent();
        BindingContext = new PerfilViewModel();
    }
}