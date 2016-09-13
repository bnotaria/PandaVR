<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMaster.Master" AutoEventWireup="true" CodeBehind="Reddot.aspx.cs" Inherits="Website.contentsample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h2>AR extention to the Minimap</h2>

	<div class="jumbotron">
		Screen shot here
		<h4>Screen Shot Text</h4>
	</div>
    
	<strong>Language: </strong>Unity3D using ShaderLab(V1) and C#(V2)<br />
    <strong>Goal: </strong> Make a Holographic Scope that works in VR.<br />
    <h1>Verson 1</h1>
    <strong>Approach: </strong> Used Shader logic to match the physics of a Holographic scope.<br />
    <strong>Details: </strong> <br />
    A "red dot" scope works by producting parellal light rays. 
    This maps to shader code very directly.
    First, I use texture coordnets to pass the scope's normal to the fragment shader. 
    Then just dot this with the camera direction. 
    <br />
    
    <h1>Verson 2</h1>
    <strong>Approach: </strong> Mimic the funcitonaly of V1 but with full textures Holographic scope.<br />
    <strong>Details: </strong> <br />
    The previous scope does not allow the artist to have a custom texture. 
    Red dot appears at the scopes closest point to the camera.
    Version 2 takes advantage of this by abandoning the shader approach, instead it just moves the UV's around. 
    I porject the camera's location onto the scopes plane then take the distance between this point and the center of the scope. 
    I use this distance to shift the UVs.


	<div class="well">
		<div class="row">Got some stuff going on here.</div>
		<div class="row"><a href="#"> <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>&nbsp;Maybe a download link?</a></div>
	</div>
</asp:Content>
