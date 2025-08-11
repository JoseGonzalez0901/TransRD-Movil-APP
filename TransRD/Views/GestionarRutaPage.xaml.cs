using TransRD.ViewModels;

namespace TransRD.Views;

public partial class GestionarRutaPage : ContentPage
{
	public GestionarRutaPage(GestionarRutaViewModel viewModel)
	{
		InitializeComponent();
        BindingContext = viewModel;
	}
    protected override async void OnAppearing()
    {
        base.OnAppearing();

        if (BindingContext is GestionarRutaViewModel viewModel)
        {
            await viewModel.LoadAsync();
        }
    }

        private void OnAgregarRutaClicked(object sender, EventArgs e)
    {

    }
}