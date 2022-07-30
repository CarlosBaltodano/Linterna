using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace Linterna.VistaModelo
{
    public class VMLinternaPage:BaseViewModel
    {
        #region VARIABLES
        bool _encendido;
        string iconoon = "encender.png";
        string iconooff = "apagar.png";
        string focooff = "focooff.png";
        string focoon = "focoon.png";
        public string OnOffIcon { get => _encendido ? iconoon : iconooff; }
        public string OnOffFoco { get => _encendido ? focoon : focooff; }
        string _Texto;
        #endregion
        #region CONSTRUCTOR
        public VMLinternaPage(INavigation navigation)
        {
            Navigation = navigation;
        }
        #endregion
        #region OBJETOS
        public string Texto
        {
            get { return _Texto; }
            set { SetValue(ref _Texto, value); }
        }
        public bool Encendido
        {
            get { return _encendido; }
            set { SetValue(ref _encendido, value);
                OnPropertyChanged(nameof(OnOffIcon));
                OnPropertyChanged(nameof(OnOffFoco));
            }
        }
        #endregion
        #region PROCESOS
        public async Task Apagar()
        {
            await Flashlight.TurnOffAsync();
        }
        public async Task Encender()
        {
            Vibrar();
            await Flashlight.TurnOnAsync();
        }
        public void Vibrar()
        {
            Vibration.Vibrate();
            var duration = TimeSpan.FromSeconds(1);
            Vibration.Vibrate(duration);
        }
        public async Task OnOff()
        {
            if (_encendido == true)
            {
                Encendido = false;
                await Apagar();
            }
            else
            {
                Encendido = true;
                await Encender();
            }
        }
        #endregion
        #region COMANDOS
        public ICommand OnOffcommand => new Command(async () => await OnOff());
        //public ICommand ProcesoSimpcommand => new Command(ProcesoSimple);
        #endregion
    }
}
