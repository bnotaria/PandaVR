using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
namespace ClientSoftware
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    /// 

    public partial class ClientWindow : Window
    {
        public static ClientWindow inst;
        private Dispatcher dispatcher;
        public ClientWindow()
        {
            inst = this;
            InitializeComponent();
            dispatcher = Application.Current.Dispatcher;

        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            AsynchronousClient.ReceivedMessage += AsynchronousClient_ReceivedMessage;
            new System.Threading.Thread(AsynchronousClient.StartClient).Start();
        }

        public static readonly char REC_SEP = (char)30;
        private void AsynchronousClient_ReceivedMessage(string str)
        {
            Console.WriteLine(str.Contains(REC_SEP));
            string[] parts = str.Split(REC_SEP);
            foreach (var part in parts)
            {
                if (part.Contains('{'))
                {
                    Panda.BlockPlaceModel box = JsonConvert.DeserializeObject<Panda.BlockPlaceModel>(part);
                    dispatcher.Invoke(() =>
                    {
                        txtConsoleBox.AppendText(part + Environment.NewLine);
                        txtConsoleBox.AppendText(box.id.ToString() + box.center + box.size + Environment.NewLine);
                    });
                }
            else
            {
                    dispatcher.Invoke(() =>
                    {
                        txtConsoleBox.AppendText(part + Environment.NewLine);
                    });
                }
            }
        }
    }
}
