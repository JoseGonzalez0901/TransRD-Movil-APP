using Microsoft.Maui.Controls;
using TransRD.Models;

namespace TransRD.Controls;
public enum BottomMenuTab
{
    Inicio,
    Rutas,
    Historial,
    Perfil
}
public partial class BottomMenuView : ContentView
{


    public static readonly BindableProperty SelectedTabProperty =
        BindableProperty.Create(
            nameof(SelectedTab),
            typeof(BottomMenuTab),
            typeof(BottomMenuView),
            BottomMenuTab.Rutas,
            propertyChanged: OnSelectedTabChanged);

    public BottomMenuTab SelectedTab
    {
        get => (BottomMenuTab)GetValue(SelectedTabProperty);
        set => SetValue(SelectedTabProperty, value);
    }

    /// <summary>
    /// Evento opcional si la página desea reaccionar.
    /// </summary>
    public event Action<BottomMenuTab> TabChanged;

    public BottomMenuView()
    {
        InitializeComponent();
        UpdateTabVisuals();
    }

    private static void OnSelectedTabChanged(BindableObject bindable, object oldValue, object newValue)
    {
        var view = bindable as BottomMenuView;
        if (view != null)
        {
            view.UpdateTabVisuals();
            _ = view.OnTabChanged((BottomMenuTab)newValue); // Lanzamos sin bloquear
        }
    }


    private void Tab_Tapped(object sender, EventArgs e)
    {
        if (sender is StackLayout stack)
        {
            if (stack.BindingContext is BottomMenuTab tab)
            {
                SelectedTab = tab;
            }
        }
    }

    private void UpdateTabVisuals()
    {
        UpdateTab(InicioIcon, InicioLabel, BottomMenuTab.Inicio);
        UpdateTab(RutasIcon, RutasLabel, BottomMenuTab.Rutas);
        UpdateTab(HistorialIcon, HistorialLabel, BottomMenuTab.Historial);
        UpdateTab(PerfilIcon, PerfilLabel, BottomMenuTab.Perfil);
    }

    private void UpdateTab(Image icon, Label label, BottomMenuTab tab)
    {
        bool isSelected = SelectedTab == tab;
        icon.Source = isSelected ?
            $"{tab.ToString().ToLower()}_activo.png": 
            $"{tab.ToString().ToLower()}.png";

        label.TextColor = isSelected ? Colors.Blue : Colors.Gray;
    }

    /// <summary>
    /// Lógica local al cambiar pestaña.
    /// </summary>
    private async Task OnTabChanged(BottomMenuTab selectedTab)
    {
        switch (selectedTab)
        {
            case BottomMenuTab.Inicio:
                await Navigation.PushAsync(new Views.HomePage());
                break;

            case BottomMenuTab.Rutas:
                //await Shell.Current.GoToAsync("//rutas");
                break;

            case BottomMenuTab.Historial:
               // await Shell.Current.GoToAsync("//historial");
                break;

            case BottomMenuTab.Perfil:
                

                break;
        }

        TabChanged?.Invoke(selectedTab);
    }


}
