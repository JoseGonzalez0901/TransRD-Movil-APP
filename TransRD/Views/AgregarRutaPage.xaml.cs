using TransRD.ViewModels;

namespace TransRD.Views;

public partial class AgregarRutaPage : ContentPage
{
	public AgregarRutaPage(AgregarRutaViewModel viewModel)
	{
        InitializeComponent();
        BindingContext = viewModel;
    }
}