using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Text;

// State object for receiving data from remote device.
public class StateObject
{
    // Client socket.
    public Socket workSocket = null;
    // Size of receive buffer.
    public const int BufferSize = 256;
    // Receive buffer.
    public byte[] buffer = new byte[BufferSize];
    // Received data string.
    public StringBuilder sb = new StringBuilder();
    public int id = 0;
}

public class AsynchronousClient
{
    public static int id_src;
    // The port number for the remote device.
    private const int port = 11000;

    // ManualResetEvent instances signal completion.
    private static ManualResetEvent connectDone =
        new ManualResetEvent(false);
    private static ManualResetEvent sendDone =
        new ManualResetEvent(false);
    private static ManualResetEvent receiveDone =
        new ManualResetEvent(false);

    // The response from the remote device.
    private static String response = String.Empty;
    static Socket client;
    public static void StartClient()
    {
        
        ClientSoftware.ClientWindow.inst.Closed += Inst_Closed;
        // Connect to a remote device.
        try
        {
            // Establish the remote endpoint for the socket.
            // The name of the 
            // remote device is "host.contoso.com".
            IPHostEntry ipHostInfo = Dns.Resolve(Dns.GetHostName());
            Console.WriteLine(Dns.GetHostName());
            IPAddress ipAddress = ipHostInfo.AddressList[0];
            Console.WriteLine(ipAddress);
            IPEndPoint remoteEP = new IPEndPoint(ipAddress, port);

            // Create a TCP/IP socket.
            client = new Socket(AddressFamily.InterNetwork,
                SocketType.Stream, ProtocolType.Tcp);

            // Connect to the remote endpoint.
            client.BeginConnect(remoteEP,
                new AsyncCallback(ConnectCallback), client);
            connectDone.WaitOne();

            // Send test data to the remote device.
            Send(client, "This is sent from the client to the server.<EOF>");
            sendDone.WaitOne();
            Console.WriteLine("Strating to listen");
            // Receive the response from the remote device.
                Receive(client);
            //    receiveDone.WaitOne();
             //   receiveDone.Reset();
           //     if (response != null)
            //    {
            //        Console.WriteLine("(C)---------------------->Response received : {0}", response);
             //   }
            //}

            // Write the response to the console.

            //client.Shutdown(SocketShutdown.Both);
            //client.Close();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
    }

    private static void Inst_Closed(object sender, EventArgs e)
    {

        // Release the socket.
        client.Shutdown(SocketShutdown.Both);
        client.Close();
    }

    private static void ConnectCallback(IAsyncResult ar)
    {
        try
        {
            // Retrieve the socket from the state object.
            Socket client = (Socket)ar.AsyncState;

            // Complete the connection.
            client.EndConnect(ar);

            Console.WriteLine("(C)Socket connected to {0}",
                client.RemoteEndPoint.ToString());

            // Signal that the connection has been made.
            connectDone.Set();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
    }

    private static void Receive(Socket client)
    {
        Console.WriteLine("(C)Received: "+id_src);
        try
        {
            // Create the state object.
            StateObject state = new StateObject();
            state.workSocket = client;
            state.id = id_src++;
            // Begin receiving the data from the remote device.
            client.BeginReceive(state.buffer, 0, StateObject.BufferSize, 0,
                new AsyncCallback(ReceiveCallback), state);
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
    }

    private static void ReceiveCallback(IAsyncResult ar)
    {
       // Console.WriteLine("(C)ReceivedCB");
        try
        {
            // Retrieve the state object and the client socket 
            // from the asynchronous state object.
            StateObject state = (StateObject)ar.AsyncState;
            Socket client = state.workSocket;

            // Read data from the remote device.
            int bytesRead = client.EndReceive(ar);
                // There might be more data, so store the data received so far.

            //Console.WriteLine("(C)Received"+bytesRead+"ava:"+client.Available);
            if (bytesRead> 0)
                state.sb.Append(Encoding.ASCII.GetString(state.buffer, 0, bytesRead));
            
            if (client.Available == 0)
            {
                string str = state.sb.ToString();
                state.sb.Clear();
                if (ReceivedMessage != null)
                    ReceivedMessage.Invoke(str);
            }

                client.BeginReceive(state.buffer, 0, StateObject.BufferSize, 0,
                    new AsyncCallback(ReceiveCallback), state);
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
    }
    public static event Action<string> ReceivedMessage;
    private static void Send(Socket client, String data)
    {
        // Convert the string data to byte data using ASCII encoding.
        byte[] byteData = Encoding.ASCII.GetBytes(data);

        // Begin sending the data to the remote device.
        client.BeginSend(byteData, 0, byteData.Length, 0,
            new AsyncCallback(SendCallback), client);
    }

    private static void SendCallback(IAsyncResult ar)
    {
        try
        {
            // Retrieve the socket from the state object.
            Socket client = (Socket)ar.AsyncState;

            // Complete sending the data to the remote device.
            int bytesSent = client.EndSend(ar);
            Console.WriteLine("(C)Sent {0} bytes to server.", bytesSent);

            // Signal that all bytes have been sent.
            sendDone.Set();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
    }

    public static int Main1(String[] args)
    {
        StartClient();
        return 0;
    }
}