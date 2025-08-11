using TransRD.ViewModels;

namespace TransRD.Views;

public partial class HistorialPage : ContentPage
{
	public HistorialPage(HistorialViewModel ViewModel)
	{
		InitializeComponent();
        BindingContext = ViewModel;
    }
}