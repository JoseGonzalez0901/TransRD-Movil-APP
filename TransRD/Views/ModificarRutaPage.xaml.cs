using TransRD.ViewModels;

namespace TransRD.Views;

public partial class ModificarRutaPage : ContentPage
{
	public ModificarRutaPage()
	{
		InitializeComponent();
        BindingContext = new ModificarRutaViewModel();
    }
}