using TransRD.ViewModels;

namespace TransRD.Views;

public partial class ReportarProblemaPage : ContentPage
{
	public ReportarProblemaPage()
	{
		InitializeComponent();
        BindingContext = new ReportarProblemaViewModel();
    }
}