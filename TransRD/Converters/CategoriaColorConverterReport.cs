using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransRD.Converters
{
    class CategoriaColorConverterReport : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var selected = value?.ToString();
            var current = parameter?.ToString();

            return selected == current ? Color.FromArgb("#2563EB") : Color.FromArgb("#9CA3AF");
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
            => throw new NotImplementedException();
    }
}
