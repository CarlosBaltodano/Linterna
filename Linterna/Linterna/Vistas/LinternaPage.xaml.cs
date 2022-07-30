using Linterna.VistaModelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Linterna.Vistas
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LinternaPage : ContentPage
    {
        public LinternaPage()
        {
            InitializeComponent();
            BindingContext = new VMLinternaPage(Navigation);
        }
    }
}