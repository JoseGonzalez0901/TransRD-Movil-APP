using TransRD.ViewModels;

namespace TransRD.Views;

public partial class AgregarRutaPage : ContentPage
{
	public AgregarRutaPage()
	{
        InitializeComponent();
        BindingContext = new AgregarRutaViewModel();
    }
}