// Converters/SelectedColorConverter.cs
using System;
using System.Globalization;

namespace TransRD.Converters
{
    // Converters/SelectedColorConverter.cs
    public class SelectedColorConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            if (values.Length < 2 || values[0] is not string selected || values[1] is not string current)
                return Color.FromArgb("#9CA3AF");

            return selected == current ? Color.FromArgb("#2563EB") : Color.FromArgb("#9CA3AF");
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture) =>
            throw new NotImplementedException();
    }

}
