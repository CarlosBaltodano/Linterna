using System;
using Xamarin.Forms;
using Linterna.Vistas;
using Xamarin.Forms.Xaml;

namespace Linterna
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new LinternaPage();
        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
