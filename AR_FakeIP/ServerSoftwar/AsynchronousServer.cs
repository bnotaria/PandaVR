using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using UnityEngine;
namespace ServerSoftware
{
    using System;
    using System.Net;
    using System.Net.Sockets;
    using System.Text;
    using System.Threading;

    // State object for reading client data asynchronously
    public class StateObject
    {
        // Client  socket.
        public Socket workSocket = null;
        // Size of receive buffer.
        public const int BufferSize = 1024;
        // Receive buffer.
        public byte[] buffer = new byte[BufferSize];
        // Received data string.
        public StringBuilder sb = new StringBuilder();
    }

    public class AsynchronousSocketListener
    {
        // Thread signal.
        public static ManualResetEvent allDone = new ManualResetEvent(false);
        public static List<StateObject> clients;
        public static void StopListening()
        {
            if (OnClose != null)
                OnClose.Invoke();
            run = false;
        }
        static bool run = true;
        public static void OnClickSend(Panda.BlockPlaceModel place)
        {
            Console.WriteLine("EVENT: "+clients.Count);
            //Panda.BlockPlaceModel place = new Panda.BlockPlaceModel();
            //place.id = 0;
            //place.llb = new Vector3(0, 0, 0);
            //place.urf = new Vector3(10, 2, 5);
            Panda.NetMessage msg;
            msg.messageType = Panda.MessageType.BlockPlace;
            msg.message = JsonConvert.SerializeObject(place);
            for (int i = 0; i < clients.Count; i++)
            {
                if(clients[i].workSocket.Connected)
                    Send(clients[i].workSocket, JsonConvert.SerializeObject(msg));
            }
        }
        public static void OnInitClick(Panda.MessageInit init)
        {
            Panda.NetMessage msg;
            msg.messageType = Panda.MessageType.Init;
            msg.message = JsonConvert.SerializeObject(init);
            for (int i = 0; i < clients.Count; i++)
            {
                if (clients[i].workSocket.Connected)
                    Send(clients[i].workSocket, JsonConvert.SerializeObject(msg));
            }
        }
        public static int evt = 0;
        public static void StartListening()
        {
            clients = new List<StateObject>();
            Console.WriteLine((evt++)+"StartListening");
            MainWindow.OnClickSend += OnClickSend;
            MainWindow.inst.Closed += Inst_Closed;
            // Data buffer for incoming data.
            byte[] bytes = new Byte[1024];

            // Establish the local endpoint for the socket.
            // The DNS name of the computer
            // running the listener is "host.contoso.com".
            IPHostEntry ipHostInfo = Dns.Resolve(Dns.GetHostName());
            IPAddress ipAddress = ipHostInfo.AddressList[0];
            MainWindow.inst.Dispatcher.Invoke(() => { MainWindow.inst.Title = ipAddress.ToString(); });
            IPEndPoint localEndPoint = new IPEndPoint(ipAddress, 11000);

            // Create a TCP/IP socket.
            Socket listener = new Socket(AddressFamily.InterNetwork,
                SocketType.Stream, ProtocolType.Tcp);

            // Bind the socket to the local endpoint and listen for incoming connections.
            try
            {
                listener.Bind(localEndPoint);
                listener.Listen(100);

                while (run)
                {
                    // Set the event to nonsignaled state.
                    allDone.Reset();

                    // Start an asynchronous socket to listen for connections.
                    Console.WriteLine("Waiting for a connection...");
                    listener.BeginAccept(
                        new AsyncCallback(AcceptCallback),
                        listener);

                    // Wait until a connection is made before continuing.
                    allDone.WaitOne();
                }

            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }

            Console.WriteLine("\nPress ENTER to continue...");
            Console.Read();

        }

        private static void Inst_Closed(object sender, EventArgs e)
        {
            StopListening();
        }

        static Socket lastHandler;
        public static void AcceptCallback(IAsyncResult ar)
        {
            //Console.WriteLine((evt++) + "AcceptCallback");
            // Signal the main thread to continue.
            allDone.Set();

            // Get the socket that handles the client request.
            Socket listener = (Socket)ar.AsyncState;
            Socket handler = listener.EndAccept(ar);
            lastHandler = handler;
            // Create the state object.
            StateObject state = new StateObject();
            state.workSocket = handler;
            clients.Add(state);
            Console.WriteLine("(S)Have {0} client attached.", clients.Count);
            handler.BeginReceive(state.buffer, 0, StateObject.BufferSize, 0,
                new AsyncCallback(ReadCallback), state);

            OnClose += () =>
            {
                Console.WriteLine("Closing socket:" + handler.ToString());
                if (handler.IsBound) {
                    handler.Shutdown(SocketShutdown.Both);
                    handler.Close();
                }
            };
        }

        public static void ReadCallback(IAsyncResult ar)
        {
            //Console.WriteLine((evt++) + ">ReadCallback");
            String content = String.Empty;

            // Retrieve the state object and the handler socket
            // from the asynchronous state object.
            StateObject state = (StateObject)ar.AsyncState;
            Socket handler = state.workSocket;

            // Read data from the client socket. 
            int bytesRead = handler.EndReceive(ar);

            if (bytesRead > 0)
            {
                // There  might be more data, so store the data received so far.
                state.sb.Append(Encoding.ASCII.GetString(
                    state.buffer, 0, bytesRead));

                // Check for end-of-file tag. If it is not there, read 
                // more data.
                content = state.sb.ToString();
                if (content.IndexOf("<EOF>") > -1)
                {
                    // All the data has been read from the 
                    // client. Display it on the console.
                    Console.WriteLine("(S)Read {0} bytes from socket. \n Data : {1}",
                        content.Length, content);
                    // Echo the data back to the client.
                    Send(handler, "This is what was sent back");
                    Send(handler, "This is what was sent back2");
                }
                else
                {
                    // Not all data received. Get more.
                    handler.BeginReceive(state.buffer, 0, StateObject.BufferSize, 0,
                    new AsyncCallback(ReadCallback), state);
                }
            }
            //Console.WriteLine((evt++) + "<ReadCallback");
        }

        private static void Send(Socket handler, String data)
        {
            //Console.WriteLine((evt++) + ">Send: "+data);
            // Convert the string data to byte data using ASCII encoding.
            byte[] byteData = Encoding.ASCII.GetBytes(data+ (char)30);
            // Begin sending the data to the remote device.
            try
            {
                if (handler.Connected)
                    handler.BeginSend(byteData, 0, byteData.Length, 0,
                        new AsyncCallback(SendCallback), handler);
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
            
            //Console.WriteLine((evt++) + "<Send: " + data);
        }
        public static event Action OnClose;
        private static void SendCallback(IAsyncResult ar)
        {

            //Console.WriteLine((evt++) + ">SendCallback");
            try
            {
                // Retrieve the socket from the state object.
                Socket handler = (Socket)ar.AsyncState;

                // Complete sending the data to the remote device.
                int bytesSent = handler.EndSend(ar);
                Console.WriteLine("(S)Sent {0} bytes to client.", bytesSent);


            }
            catch (Exception e)
            {
                Console.WriteLine("(S)"+e.ToString());
            }

            //Console.WriteLine((evt++) + "<SendCallback");
        }


        public static int Main1(String[] args)
        {
            StartListening();
            return 0;
        }
    }
}
