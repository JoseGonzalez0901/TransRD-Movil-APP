using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransRD.Models
{
    public class Navigate
    {
        public static async Task NavigateToPage(Page pageType, bool Comeback)
        {
            Application.Current.MainPage = new NavigationPage(pageType);
        }

    }


}
