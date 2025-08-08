using TransRD.ViewModels;

namespace TransRD.Views;

public partial class ModificarRutaPage : ContentPage
{
	public ModificarRutaPage(ModificarRutaViewModel  viewModel)
	{
		InitializeComponent();
        BindingContext = viewModel;
    }
}