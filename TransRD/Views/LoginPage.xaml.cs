using CommunityToolkit.Mvvm.DependencyInjection;
using TransRD.ViewModels;

namespace TransRD.Views;

public partial class LoginPage : ContentPage
{
    public LoginPage(LoginViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }   
}