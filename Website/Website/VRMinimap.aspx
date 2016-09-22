<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMaster.Master" AutoEventWireup="true" CodeBehind="VRMinimap.aspx.cs" Inherits="Website.contentsample" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h2>Virtual Realty Minimap</h2>

	<div class="jumbotron">
        <iframe src='https://gfycat.com/ifr/InfatuatedUnluckyBuffalo' frameborder='0' scrolling='no' width='640' height='360' allowfullscreen></iframe>
		<h4>Virtaul Reality Minimap being used to make a hut around the user.</h4>
	</div>

	<strong>Language: </strong>Unity3D using C#<br />
    <strong>Goal: </strong> Full 3D minimap<br />
    <strong>Aproach: </strong> Uses a second camera, changing the Interpupillary distance (IPD) to shrink the world.<br />
    <strong>Details: </strong> <br />
    Unity3D's stereo camera automaticly places itself at the location of the HMD. 
    The IPD scalling and location scalling is done using Unity3D's built transform. 
    Next, I changed the settings of the Minimap camera.
    Turned off the buffer clears so they render using the same Z-buffer.
    Then scaled the second Z-buffer by changing the near and far clipping plan to match the scale.
    <br /><br />
    This works and shows up in world, while still being properly occluded.
    I then shift it based center of the map and location in world it.
    <br />
    <strong>TODO:</strong> Use a replacement shader to trim the area rendered. 

	<div class="well">
		<div class="row">Got some stuff going on here.</div>
		<div class="row"><a href="#"> <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>&nbsp;Maybe a download link?</a></div>
	</div>
</asp:Content>
