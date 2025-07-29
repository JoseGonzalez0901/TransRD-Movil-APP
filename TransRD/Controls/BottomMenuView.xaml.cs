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
            view.OnTabChanged((BottomMenuTab)newValue);
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
    private void OnTabChanged(BottomMenuTab selectedTab)
    {
        switch(selectedTab)
        {
                case BottomMenuTab.Inicio:
                Navigate.NavigateToPage(new Views.HomePage(), true);
                break;
                case BottomMenuTab.Rutas:
                //Navigate.NavigateToPage(new Views.RutasPage(), true);
                break;
                case BottomMenuTab.Historial:
                //Navigate.NavigateToPage(new Views.HistorialPage(), true);
                break;
                case BottomMenuTab.Perfil:
                Navigate.NavigateToPage(new Views.PerfilPage(), true);
                break;
        }
       
        //TabChanged?.Invoke(selectedTab);
    }
}
