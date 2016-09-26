<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMaster.Master" AutoEventWireup="true" CodeBehind="MastersThesis.aspx.cs" Inherits="Website.contentsample" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h2>Demonstration of Panda-Talent</h2>

	<div class="jumbotron">
		<blockquote class="imgur-embed-pub" lang="en" data-id="pYdxeUc"><a href="//imgur.com/pYdxeUc"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>
		<h4>Video of my Master's Thesis. Toolbar is on the left. RadiANT DICOM viewer in the center. On the right: Leap Motion view for recognision and a color video for demostation purposes.</h4>
	</div>
    
	<strong>Language: </strong> Toolbar in C#, Data analysis in Matlab and prototyping in Unity.<br />
    <strong>Goal: </strong> Allow a surgeon to manipulate DICOM scans while mantaining a sterile environment.<br />
    <strong>Approach: </strong> The project was split into two parts: Protocal design and Gesture Recognition. The Protocal uses 1 gesture and menu system. The Gestoure recognition use SVD and k nearest neigbors.<br />
    <strong>Details: </strong> <br />

    
    The goal of my work is to design and implement a gesture-based interface with a DICOM compliant image viewer. DICOM is a widely accepted standard for storing and viewing medical imagery. DICOM viewers require use of a mouse to interact with menus and to manipulate imagery. For a surgeon to use a DICOM viewer in an operating room, a method of covering the mouse or assistance from another person is required. This is usually not practical. 
    <br /><br />
    In this thesis, I have developed a gesture-based interface which maps mouse actions to hand gestures. The interface is intuitive and designed to add minimal cognitive load on the user. The system uses the Leap Motion to track hands. The output of the Leap Motion are ``bones'' of the hand, which are projected to low dimensional space using Singular Vector Decomposition to obtain a compact gesture representation. Gesture recognition is performed using $k$ Nearest Neighbors in this low dimensional space.
    <br /><br />
    I have implemented a system prototype with RadiAnt DICOM compliant viewer, Leap Motion and Unity. I ran a series of tests to evaluate my interface. First, I determined system usability with Dr. Jeffrey Mai~\cite{jmai}. Then I tested the gesture recognition with two users. Finally, I tested recognition times with dry and gloved hands covered with simulated blood.

	<div class="well">
		<div class="row">Downloads: </div>
		<div class="row"><a href="Download/Thesis_beamer_BrianN.pdf"> <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>&nbsp;Slides</a></div>
		<div class="row"><a href="Download/Thesis_Main_BrianN.pdf"> <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>&nbsp;Thesis Paper</a></div>
	</div>
</asp:Content>
