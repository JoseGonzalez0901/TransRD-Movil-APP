using TransRD.Models;
using TransRD.ViewModels;
namespace TransRD.Views;

public partial class RegisterPage : ContentPage
{
	public RegisterPage(RegisterViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;

    }
}