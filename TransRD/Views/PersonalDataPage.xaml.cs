using TransRD.ViewModels;

namespace TransRD.Views;

public partial class PersonalDataPage : ContentPage
{
	public PersonalDataPage(PersonalDataViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
	}
    protected override async void OnAppearing()
    {
        base.OnAppearing();

        if (BindingContext is PersonalDataViewModel viewModel)
        {
            
            await viewModel.CargarPerfil();
        }
    }
}