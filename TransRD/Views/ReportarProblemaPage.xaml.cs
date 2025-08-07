using TransRD.ViewModels;

namespace TransRD.Views;

public partial class ReportarProblemaPage : ContentPage
{
	public ReportarProblemaPage(ReportarProblemaViewModel viewModel)
	{
		InitializeComponent();
        BindingContext = viewModel;
    }
}