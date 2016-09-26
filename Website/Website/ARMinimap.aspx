<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMaster.Master" AutoEventWireup="true" CodeBehind="ARMinimap.aspx.cs" Inherits="Website.contentsample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="fluid-container">
		<h2>AR extention to the Minimap</h2>

		<div class="jumbotron">
			<iframe class="imgur-embed" width="100%" height="404" frameborder="0" src="http://i.imgur.com/JwU9C0j.gifv#embed"></iframe>
			<h4>Screen Shot Text</h4>
		</div>

		<div>
			<strong>Language:</strong>Unity3D using C#
		</div>
		<div>
			<strong>Goal:</strong> Allow second user to see the minimap using a AR phone.
		</div>
		<div>
			<strong>Approach:</strong> Used an augment reality SDK and tag on a table, then project the minimap content ontop.
		</div>

		<div class="spacer">
			<p>
				While one player uses the HTC vive tracked controllers to build a fort, as in <a href="/VRMinimap.aspx">the VR minimap</a>, another user can view the fort. This is achieved with two seperate programs, the VR fort demo and a phone viewer. For development I used a webcam attached to my computer for the phone. The "phone" viewer is also written in Unity3d with the help of <a href="https://www.hitl.washington.edu/artoolkit/">the ARToolkit</a>. This worked for under Idea curcomstances but ultimately was not meant for unity.
			</p>
			<p>
				I switch over to vuforia. This is SDK I saw an a /r/Unity3d and has much better unity support. It is a Natural Feature Tracking solution. That does the preprossing phase on the web, giving you a .unitypackage with the tracking info. For the tag, I lack a printer, so I made my own with some paint and heavy stock I had laying around.
			</p>
			<p>
				When the "phone" boots up, it sends connects to the server over .Net.Sockets. The server logs this client connection and sends any already placed items. The "phone" renders this place items based of the location of the Tag. The result is a way for a "little brother" to watch the player build. 
			</p>
			<p>
				The Network communication right now is hardcoded IPs. This is good in a test envirment but should be switch to another solution. Possible the VR host displaying a QR code with the host IP, being that this is only meant for LAN. 
			</p>
			<p>
				While developing my communaction format, I created a 2 WPF application for debugging. The first acted as a "fake" server, it send all the same massages but control the inputs by sliders. The second acted as a "fake" client, it posted all the incoming messages to a textbox, allowing a clear view of what is received. This server code was then shared with Unity3D for use with the VR setup. This allowed my to mix and match what server and client(s) I used.
			</p>
			<p>
				This two WPF used NewtonSoft JSON.net for my serialization, which is not supported by Unity3d because of a .net version missmatch. For the unity3d end, I used the lightweight JsonUtility built in to Unity3d. This utillity only allowed for structed Json, so I made a new sturct that only had message type and payload as variables. This meant that I could send the incomming message off to the right parser in Unity.
			</p>
		</div>

		<%--<div class="well">
		<div class="row">Got some stuff going on here.</div>
		<div class="row"><a href="#"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>&nbsp;Maybe a download link?</a></div>
		</div>--%>
	</div>
</asp:Content>
