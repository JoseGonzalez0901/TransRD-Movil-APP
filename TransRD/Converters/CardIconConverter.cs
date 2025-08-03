using System;
using System.Globalization;
using Microsoft.Maui.Controls;

namespace TransRD.Converters
{
    public class CardIconConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var tipo = value?.ToString()?.ToLower();
            return tipo switch
            {
                "visa" => "visa_icon.png",
                "mastercard" => "mastercard_icon.png",
                _ => "card_icon.png"
            };
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) => throw new NotImplementedException();
    }
}
