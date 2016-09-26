<%@ Page Title="" Language="C#" MasterPageFile="~/PrimaryMaster.Master" AutoEventWireup="true" CodeBehind="tablisting.aspx.cs" Inherits="Website.tablisting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		$(document).ready(function () {
			$("#PandaTabs").tabs();
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div id="PandaTabs" class="spacer">
		<ul>
			<li><a href="#tabsUnity">Unity and Virtual Reality</a></li>
			<li><a href="#tabsMath">Mathematics</a></li>
			<li><a href="#tabsC">C++</a></li>
			<li><a href="#tabsRobitics">Robitics</a></li>
		</ul>
		<div id="tabsUnity">
			<h1>Virtual Reality</h1>
			<h3>CS777 - Human Computer Intelegent Interaction</h3>
			<p>Overview of HCII, from the perspective of a computer scientist. They course included reading importent peices from existing literature. Individuals also had to research an aspect of HCII and write a paper on the subject.</p>

			<div class="well">
				<h4>Large Project: VR Testing Room</h4>
				<p>
					Inspired by a talk with a Bioengineering Professor, I wanted to make a way to run test on people in VR. I made a testing area in Unity3d which included several different settings for feedback. I then connected the envirment to a WPF admin console using Web Sockets. From this console the test adminstrator could see what the subject could see and change what feed back was given. 
				</p>
			</div>

			<hr />

			<h3>CS499 - Introduction to VR technoledges</h3>

			<p>
				Worked with the professor to the design a course syllitbus to cover VR topics. My responsibility was to lead the practiale aspects. The professor, while skilled in the ways of HCII and computer vision, was new to Unity. So I would propose assignment covering some aspect of unity or a technolegy. Then, we would poslish it up together and send it out.
			</p>
			<p>
				Topics covered: Unity basics, the Physics system, Leap Motion and Google Cardboard.
			</p>

			<hr />

			<h1>Non-Virtual Reality</h1>
			<h3>CS426 - Game Programming II</h3>
			<p>
				Semester long project to make a game. I programmed a Runge–Kutta solver for a physics game in Unity3d.
			</p>
		</div>
		<div id="tabsMath">
			<h2>CS551 - Computer Graphics</h2>

			<p>
				The course used JOGL, Java openGL. It started with a how to draw point, building up to lines and polygons. Then we used a Model View Projection matrices to create a 3d scene. We finish with Blinn-Phong shader logic.
			</p>

			<h4>Large Project: Planet</h4>

			<p>
				I wrote code to generate a sphere in such a way that the vertexes were in a systematic order. I than add verous ways to interact and color the sphere. Such ways included heat-like defusions, impact coloring, click, and Perlin noise. I also took the sphere and swapped the vertexes and faces to make a hex planet.
			</p>

			<hr />

			<h2>MATH322 - Advance Linear Algebra</h2>

			<p>
				Covered vector basis, subspaces and matrix mathematics.
			</p>

			<hr />

			<h2>MATH447 - Numerical Analysis II</h2>

			<p>
				Advance mathmatics course taught which only had had 6-8 students. Numerical Methods cover included:
			</p>

			<ul>
				<li>Singular Value Decomposition</li>
				<li>Partial Differential Equation Solver</li>
				<li>Fast Fourier Transformation </li>
			</ul>
		</div>
		<div id="tabsC">
			<h2>CS367 - Computer System and Programming</h2>
			<h4>Large Project: the BOMB</h4>
			<p>
				A group project with gcc complied EXE that would send 6 failure signals to the teacher. The goal is to pass the correct input auguments to prevent the fail signals. We were tasked with going into the x86 assembly code to find out input would skip the failure codes, and run the success signals.
			</p>

			<hr />

			<h2>CS262 - Intro to Low-level Programming </h2>
			<p>
				C basics, including pointer arithmetic.
			</p>
		</div>

		<div id="tabsRobitics">
			<h2>CS685 - Autonomous Robotics</h2>
			SLAM, point clouds and other robotics technology including ROS. 
		</div>
		<!---        
        Skills

    --->
	</div>
</asp:Content>
