<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMaster.Master" AutoEventWireup="true" CodeBehind="tablisting.aspx.cs" Inherits="Website.tablisting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		$(document).ready(function () {
			$("#PandaTabs").tabs();
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h2>Demonstration of Panda-Talent</h2>

	<div id="PandaTabs">
		<ul>
			<li><a href="#tabsVR">VR</a></li>
			<li><a href="#tabsAR">AR</a></li>
			<li><a href="#tabsOther">Other</a></li>
		</ul>
		<div id="tabsVR">
			<h2>&bull; CS 999 - Super VR Magic</h2>
			This is the VR tab.
			<h2>&bull; CS 999 - Super VR Magic</h2>
			This is the VR tab.
		</div>
		<div id="tabsAR">
			This is the AR tab.
		</div>
		<div id="tabsOther">
			This is the other tab.
		</div>
	</div>
</asp:Content>
