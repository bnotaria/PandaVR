<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMaster.Master" AutoEventWireup="true" CodeBehind="VRMinimap.aspx.cs" Inherits="Website.contentsample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="fluid-container">
		<h2>Virtual Realty Minimap</h2>

		<div class="jumbotron">
			<iframe src='https://gfycat.com/ifr/InfatuatedUnluckyBuffalo' frameborder='0' scrolling='no' width='640' height='360' allowfullscreen></iframe>
			<h4>Virtual Reality Minimap being used to make a hut around the user.</h4>
		</div>

		<div>
			<strong>Language:</strong> Unity3D using C#
		</div>
		<div>
			<strong>Goal:</strong> Full 3D minimap
		</div>
		<div>
			<strong>Aproach:</strong> Uses a second camera, changing the Interpupillary distance (IPD) to shrink the world.
		</div>
		<div class="spacer">
			<p>
				Unity3D's stereo camera automaticly places itself at the location of the HMD. The IPD scalling and location scalling is done using Unity3D's built transform. Next, I changed the settings of the Minimap camera. Turned off the buffer clears so they render using the same Z-buffer. Then scaled the second Z-buffer by changing the near and far clipping plan to match the scale.
			</p>
			<p>
				This works and shows up in world, while still being properly occluded. I then shift it based center of the map and location in world it.
			</p>
			<p>
				<strong>TODO:</strong> Use a replacement shader to trim the area rendered. 
			</p>
		</div>

		<%--<div class="well">
		<div class="row">Got some stuff going on here.</div>
		<div class="row"><a href="#"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>&nbsp;Maybe a download link?</a></div>
		</div>--%>
	</div>
</asp:Content>
