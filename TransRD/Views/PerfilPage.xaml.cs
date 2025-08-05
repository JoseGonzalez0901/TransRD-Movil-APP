using TransRD.Interfaces;
using TransRD.ViewModels;

namespace TransRD.Views;

public partial class PerfilPage : ContentPage
{
	public PerfilPage(PerfilViewModel viewModel)
	{
		InitializeComponent();
        BindingContext = viewModel;
    }
    protected override async void OnAppearing()
    {
        base.OnAppearing();

        if (BindingContext is PerfilViewModel viewModel)
        {
            await viewModel.CargarPerfil();
        }
    }

}