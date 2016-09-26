using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
using System.Threading;
using Panda;
namespace ServerSoftware
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static MainWindow inst;
        Thread server;
        public static event Action<BlockPlaceModel> OnClickSend;
                BlockPlaceModel bpm = new BlockPlaceModel();
        public bool initDone;
        public BlockPlaceModel[] fort = new BlockPlaceModel[] {
            new BlockPlaceModel {id =  0,llb = new Vector3m(-5,0,-5),urf = new Vector3m(-4,5,-4),mat = 0},
            new BlockPlaceModel {id =  1,llb = new Vector3m( 4,0,-5),urf = new Vector3m( 5,5,-4),mat = 0},
            new BlockPlaceModel {id =  2,llb = new Vector3m(-5,0, 4),urf = new Vector3m(-4,5, 5),mat = 0},
            new BlockPlaceModel {id =  3,llb = new Vector3m( 4,0, 4),urf = new Vector3m( 5,5, 5),mat = 0},

            new BlockPlaceModel {id =  4,llb = new Vector3m(-4,0,-5),urf = new Vector3m( 4,4,-4),mat = 1},
            new BlockPlaceModel {id =  5,llb = new Vector3m(-5,0,-4),urf = new Vector3m(-4,2, 4),mat = 2},
            new BlockPlaceModel {id =  6,llb = new Vector3m( 4,0,-4),urf = new Vector3m( 5,2, 4),mat = 3},

            new BlockPlaceModel {id =  7,llb = new Vector3m(-4,0,4),urf = new Vector3m(-1,2, 5),mat = 9},
            new BlockPlaceModel {id =  8,llb = new Vector3m( 1,0,4),urf = new Vector3m( 4,2, 5),mat = 1},
            new BlockPlaceModel {id =  9,llb = new Vector3m(-2,2,4),urf = new Vector3m(-1,4, 5),mat = 2},
            new BlockPlaceModel {id = 10,llb = new Vector3m( 1,2,4),urf = new Vector3m( 2,4, 5),mat = 3},

            new BlockPlaceModel {id = 11,llb = new Vector3m(-4,4, 4),urf = new Vector3m( 4,5, 5),mat = 8},
            new BlockPlaceModel {id = 12,llb = new Vector3m(-5,4,-4),urf = new Vector3m(-4,5, 4),mat = 8},
            new BlockPlaceModel {id = 13,llb = new Vector3m( 4,4,-4),urf = new Vector3m( 5,5, 4),mat = 8},
            new BlockPlaceModel {id = 14,llb = new Vector3m(-4,4,-5),urf = new Vector3m( 4,5,-4),mat = 8},

            new BlockPlaceModel {id = 15,llb = new Vector3m(-5,5,-5),urf = new Vector3m(-2,6, 2),mat = 7},
            new BlockPlaceModel {id = 16,llb = new Vector3m(-5,5, 2),urf = new Vector3m( 2,6, 5),mat = 6},
            new BlockPlaceModel {id = 17,llb = new Vector3m(-2,5,-5),urf = new Vector3m( 5,6,-2),mat = 5},
            new BlockPlaceModel {id = 18,llb = new Vector3m( 2,5,-2),urf = new Vector3m( 5,6, 5),mat = 4}
        };
        public MainWindow()
        {
            inst = this;
            server = new Thread(AsynchronousSocketListener.StartListening);
            InitializeComponent();
            
            _sld_ValueChanged();
            server.Start();
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            if (OnClickSend != null)
            {
                for(int i=0;i < fort.Length;i++)
                    OnClickSend.Invoke(fort[i]);
            }

        }

        private void send_Click(object sender, RoutedEventArgs e)
        {
            if (OnClickSend != null)
            {
                OnClickSend.Invoke(bpm);
            }
        }
        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
        }

        private void sld_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            if (!this.IsLoaded) return;
            _sld_ValueChanged();
        }
        void _sld_ValueChanged()
        {
            bpm.id = (int)sld_ID.Value;
            bpm.mat = (int)sld_mat.Value;
            bpm.llb = new Vector3m(sld_x.Value, sld_y.Value, sld_z.Value);
            bpm.urf = bpm.llb + new Vector3m(sld_width.Value, sld_height.Value, sld_depth.Value);
            String str = "ID" + bpm.id + Environment.NewLine;
            str += "mat: " + bpm.mat + Environment.NewLine;
            str += "llb: " + bpm.llb + Environment.NewLine;
            str += "urf: " + bpm.urf + Environment.NewLine;
            lbl_bpm.Content = str;
        }

        private void btnSendInit_Click(object sender, RoutedEventArgs e)
        {
            MessageInit init;
            if(float.TryParse(txtInit.Text,out init.Size))
            AsynchronousSocketListener.OnInitClick(init);
        }
    }
}
