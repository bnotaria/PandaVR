<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMaster.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Website.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Brian Notarianni</h1>
    Computer Science MS from George Mason University<br />
    Computer Science BS from George Mason University<br />
    Mathmatics BS from George Mason University <br />
    <a href="mailto:bnotaria@gmail.com">bnotaria@gmail.com</a>

	<div class="container-fluid">
		
		<div class="well frontpageContent">
			<h2><a href="/VRMinimap.aspx">Virtual Reality Minimap</a></h2>
			<div class="leftPane">
			    <iframe src='https://gfycat.com/ifr/InfatuatedUnluckyBuffalo' frameborder='0' scrolling='no' width='640' height='360' allowfullscreen></iframe>
			</div>
			<div class="rightPane">
				<div class="rightPoint">
					<strong>Language:</strong>
					<p>Unity3D using C#</p>
				</div>
				<div class="rightPoint">
					<strong>Goal:</strong>
					<p>Full 3D minimap</p>
				</div>
				<div class="rightPoint">
					<strong>Approach:</strong>
					<p>Uses a second camera, changing the Interpupillary distance (IPD) to shrink the world.</p>
				</div>
			</div>
		</div>
		<div class="well frontpageContent">
			<h2><a href="/ARMinimap.aspx">Augmented Reality Minimap</a></h2>
			<div class="leftPane">
				 <blockquote class="imgur-embed-pub" lang="en" data-id="JwU9C0j"><a href="//imgur.com/JwU9C0j"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>
			</div>
			<div class="rightPane">
				<div class="rightPoint">
					<strong>Language:</strong>
					<p>Unity3D using C# + WPF</p>
				</div>
				<div class="rightPoint">
					<strong>Goal:</strong>
					<p>Allow second user to see the minimap using a AR phone.</p>
				</div>
				<div class="rightPoint">
					<strong>Approach:</strong>
					<p>Used an augment reality SDK and tag on a table, then project the minimap content ontop.</p>
				</div>
			</div>
		</div>
		<div class="well frontpageContent">
			<h2><a href="/Reddot.aspx">Virtaul Reality Holographic Scope</a></h2>
			<div class="leftPane">
			    <a href="http://imgur.com/vWfaZKz"><img src="http://i.imgur.com/vWfaZKz.png" title="source: imgur.com" /></a>
			</div>
			<div class="rightPane">
				<div class="rightPoint">
					<strong>Language:</strong>
					<p>Unity3D using C#</p>
				</div>
				<div class="rightPoint">
					<strong>Goal:</strong>
					<p>Make a Holographic Scope that works in VR.</p>
				</div>
				<div class="rightPoint">
					<strong>Approach (Shader):</strong>
					<p> Used Shader logic to match the physics of a Holographic scope.</p>
				</div>
				<div class="rightPoint">
					<strong>Approach (Texture):</strong>
					<p> Modify the UV of a quad to simulate V1.</p>
				</div>
			</div>
		</div>
		<div class="well frontpageContent">
			<h2><a href="/MastersThesis.aspx">Master's Thesis</a></h2>
			<div class="leftPane">
			    <blockquote class="imgur-embed-pub" lang="en" data-id="pYdxeUc"><a href="//imgur.com/pYdxeUc"></a></blockquote>
			    <script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>
			</div>
			<div class="rightPane">
				<div class="rightPoint">
					<strong>Language:</strong>
					<p>Toolbar in C#, Data analysis in Matlab and prototyping in Unity.</p>
				</div>
				<div class="rightPoint">
					<strong>Goal:</strong>
					<p>Allow a surgeon to manipulate DICOM scans while mantaining a sterile environment.</p>
				</div>
				<div class="rightPoint">
					<strong>Approach:</strong>
					<p> The project was split into two parts: Protocal design and Gesture Recognition. The Protocal uses 1 gesture and menu system. The Gestoure recognition use SVD and k nearest neigbors.</p>
				</div>
			</div>
		</div>
		<div class="well frontpageContent">
			<h2><a href="/tablisting.aspx">Course Work</a></h2>
            For projects while a student and other course work. 
        </div>
	</div>
</asp:Content>
