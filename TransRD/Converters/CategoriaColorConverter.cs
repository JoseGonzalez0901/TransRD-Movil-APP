using System;
using System.Globalization;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Graphics;

namespace TransRD.Converters
{
    public class CategoriaColorConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string categoriaSeleccionada = value as string;
            string categoriaBoton = parameter as string;

            return categoriaSeleccionada == categoriaBoton ? Color.FromArgb("#2563EB") : Color.FromArgb("#F2F2F2");
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return null;
        }
    }
}
