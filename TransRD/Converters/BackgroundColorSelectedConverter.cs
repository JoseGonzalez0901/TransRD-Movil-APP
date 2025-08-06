using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransRD.Converters
{
    public class BackgroundColorSelectedConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            var selected = values[0]?.ToString();
            var current = values[1]?.ToString();

            return selected == current ? Color.FromArgb("#E0F2FF") : Colors.White;
        }
        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture) =>
           throw new NotImplementedException();
    }

}
