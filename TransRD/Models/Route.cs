using System.ComponentModel;
using System.Runtime.CompilerServices;
using Microsoft.Maui.Graphics;

namespace TransRD.Models
{
    public class Route : INotifyPropertyChanged
    {
        private string line;
        private string time;
        private string status;
        private Color statusColor;
        private string icon;
        private Color backgraound;

        public string Line
        {
            get => line;
            set => SetProperty(ref line, value);
        }
        public Color Backgraound
        {
            get => backgraound;
            set => SetProperty(ref backgraound, value);
        }

        public string Time
        {
            get => time;
            set => SetProperty(ref time, value);
        }

        public string Status
        {
            get => status;
            set => SetProperty(ref status, value);
        }

        public Color StatusColor
        {
            get => statusColor;
            set => SetProperty(ref statusColor, value);
        }

        public string Icon
        {
            get => icon;
            set => SetProperty(ref icon, value);
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected bool SetProperty<T>(ref T backingField, T value, [CallerMemberName] string propertyName = "")
        {
            if (EqualityComparer<T>.Default.Equals(backingField, value))
                return false;

            backingField = value;
            OnPropertyChanged(propertyName);
            return true;
        }

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
