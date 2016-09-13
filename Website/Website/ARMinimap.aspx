<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMaster.Master" AutoEventWireup="true" CodeBehind="ARMinimap.aspx.cs" Inherits="Website.contentsample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h2>AR extention to the Minimap</h2>

	<div class="jumbotron">
		Screen shot here
		<h4>Screen Shot Text</h4>
	</div>
    
	<strong>Language: </strong>Unity3D using C#<br />
    <strong>Goal: </strong> Allow second user to see the minimap using a AR phone.<br />
    <strong>Approach: </strong> Used ARToolKit to mark a table, then project the minimap content ontop. <br />
    <strong>Details: </strong> <br />
    While one player uses the HTC vive tracked controllers to build a fort, as in <a href="/VRMinimap.aspx" >the VR minimap</a>, another user can view the fort. 
    This is achieved with two seperate programs, the VR fort demo and a phone viewer.
    The phone viewer is also written in Unity3d with the help of <a href ="https://www.hitl.washington.edu/artoolkit/">the ARToolkit</a>.
    <br /><br />
    The phone viewer signs into a server being hosted by the Vive host computer. 
    It then recieves block placement commands and make a copy of the fort. 
    <strong>NOTE:</strong> This is in early stages and will have gifs and videos added when posible.


	<div class="well">
		<div class="row">Got some stuff going on here.</div>
		<div class="row"><a href="#"> <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>&nbsp;Maybe a download link?</a></div>
	</div>
</asp:Content>
